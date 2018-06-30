using MVP.Models;
using MVP.Models.Entities;
using MVP.Checkout;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using Stripe;
using System.Web.Configuration;
using MVP.Controls;

namespace MVP.Services
{
    public class CheckoutService
    {
        public static object Checkout_Lock = new object();

        private readonly string stripePrivateKey = WebConfigurationManager.AppSettings["StripeSecretKey"];

        public CheckoutDTO GetInitialData()
        {
            var result = new CheckoutDTO();

            return result;
        }

        public CheckoutDTO GetBooking(Guid id)
        {
            var result = new CheckoutDTO();

            using (var model = new EntityModel())
            {
                var booking = model.Booking.Where(b => b.BookingId == id && b.Status == BookingStatus.PENDING)
                                           .Include(t => t.Trip)
                                           .Include(sap => sap.Trip.StartAccessPoint)
                                           .Include(dap => dap.Trip.EndAccessPoint)
                                           .Include(sr => sr.Trip.StartAccessPoint.Region)
                                           .Include(er => er.Trip.EndAccessPoint.Region)
                                           .Include(f => f.Trip.Departure.Route.Fares)
                                           .Include(p => p.Promocode)
                                           .FirstOrDefault();
                if(booking == null)
                {
                    result = null;
                }
                else
                {
                    result.BookingId = booking.BookingId;
                    result.UserId = booking.UserId;
                    result.Seats = booking.Seats;
                    result.FareType = booking.FareType;
                    result.StandardPrice = booking.Trip.Departure.Route.Fares.SingleOrDefault(f => f.Type == Fare.FareType.STANDARD).Price;
                    result.Price = booking.Trip.Departure.Route.Fares.SingleOrDefault(f => f.Type == booking.FareType).Price;
                    result.Promocode = booking.Promocode?.Code ?? string.Empty;
                    result.PromoValid = booking.FareType == Fare.FareType.PROMOTIONAL ? true : false;
                    result.Cost = booking.Cost;
                    result.StartTime = booking.Trip.StartTime;
                    result.StartRegionName = booking.Trip.StartAccessPoint.Region.Name;
                    result.StartAPName = booking.Trip.StartAccessPoint.Name;
                    result.EndRegionName = booking.Trip.EndAccessPoint.Region.Name;
                    result.EndAPName = booking.Trip.EndAccessPoint.Name;
                }
            }
            return result;
        }

        public BookingPanelDTO GetCheckoutPanelData(CheckoutDTO state)
        {
            var result = new BookingPanelDTO
            {
                BookingValid = true,
                Trigger = string.Empty,
                Seats = state.Seats,
                FareType = state.FareType,
                StandardPrice = state.StandardPrice,
                Price = state.Price,
                Promocode = state.Promocode,
                PromoValid = state.PromoValid,
                StartTime = state.StartTime,
                StartRegionName = state.StartRegionName,
                StartAPName = state.StartAPName,
                EndRegionName = state.EndRegionName,
                EndAPName = state.EndAPName,
                Cost = state.Cost
            };

            result.StandardCost = result.StandardPrice * result.Seats;

            return result;
        }

        public CheckoutDTO CheckPromo(CheckoutDTO state)
        {
            CheckoutDTO result = state;
            using (var model = new EntityModel())
            {
                bool lastminute = Math.Ceiling((state.StartTime.Date - DateTime.Today).TotalDays) < model.Settings.Select(s => s.LastMinuteThreshold).First();
                if (model.Promocode.Any(p => p.Active && p.StartDate <= DateTime.Today && p.EndDate >= DateTime.Today && p.Code.ToUpper() == state.Promocode.ToUpper()))
                {
                    result.FareType = Fare.FareType.PROMOTIONAL;
                    result.PromoValid = true;
                }
                else
                {
                    result.FareType = lastminute ? Fare.FareType.LASTMINUTE : Fare.FareType.STANDARD;
                    result.PromoValid = false;
                }
                result.Price = model.Booking.Include(b => b.Trip.Departure.Route.Fares).FirstOrDefault(b => b.BookingId == state.BookingId).Trip.Departure.Route.Fares.SingleOrDefault(f => f.Type == result.FareType).Price;
                result.Cost = result.Seats * result.Price;
            }
            return result;
        }

        public bool ProcessPayment(CheckoutDTO state, string stripeToken, out string error)
        {
            lock (Checkout_Lock)
            {
                using (var model = new EntityModel())
                {
                    var booking = model.Booking.SingleOrDefault(b => b.BookingId == state.BookingId && b.Status == BookingStatus.PENDING);
                    if (booking == null)
                    {
                        error = "Booking no longer valid.";
                        return false;
                    }
                }

                var myCharge = new StripeChargeCreateOptions
                {
                    Amount = (int)(state.Cost * 100),
                    Currency = "EUR",
                    Description = state.BookingId.ToString(),
                    SourceTokenOrExistingSourceId = stripeToken
                };

                var chargeService = new StripeChargeService(stripePrivateKey);

                try
                {
                    var stripeCharge = chargeService.Create(myCharge);
                }
                catch (StripeException ex)
                {
                    StripeError stripeError = ex.StripeError;

                    // Handle error
                    error = stripeError.ErrorType;
                    return false;
                }

                // Charge sucessful
                UpdateBooking(state, BookingStatus.BOOKED);
                error = string.Empty;
                return true;
            }
        }

        public void UpdateBooking(CheckoutDTO state, BookingStatus status)
        {
            using (var model = new EntityModel())
            {
                var booking = model.Booking.Include(t => t.Trip).Include(p => p.Promocode).SingleOrDefault(b => b.BookingId == state.BookingId);

                if (booking != null)
                {
                    booking.Status = status;
                    booking.TicketCode = GenerateTicket(6);
                    booking.FareType = state.FareType;
                    booking.Promocode = model.Promocode.FirstOrDefault(p => p.Code.ToUpper() == state.Promocode.ToUpper());
                    booking.Cost = state.Cost;

                    model.SaveChanges();

                    UpdateTrip(booking.Trip.TripId, model);
                }
            }
        }

        public void UpdateTrip(Guid id, EntityModel model)
        {
            var trip = model.Trip.Include(b => b.Bookings).SingleOrDefault(t => t.TripId == id);
            var bookings = trip.Bookings;

            if (trip == null || trip.Status == TripStatus.CANCELLED || trip.Status == TripStatus.COMPLETED)
            {
                return;
            }

            if (trip.StartTime < DateTime.Now)
            {
                trip.Status = TripStatus.COMPLETED;
                foreach (Booking b in bookings.Where(s => s.Status == BookingStatus.BOOKED))
                {
                    b.Status = BookingStatus.COMPLETED;
                }
                model.SaveChanges();
                return;
            }

            if (trip.Status == TripStatus.PENDING)
            {
                if (bookings.Where(s => s.Status == BookingStatus.BOOKED).Count() > 0)
                {
                    trip.Status = TripStatus.BOOKED;
                    model.SaveChanges();
                    return;
                }

                if (bookings.Where(s => s.Status == BookingStatus.PENDING).Count() == 0)
                {
                    trip.Status = TripStatus.CANCELLED;
                    model.SaveChanges();
                    return;
                }
            }
        }

        public string GenerateTicket(int length)
        {
            string vowels = "aaaaaeeeeeeeiiiiiooooouuu";
            string consonants = "bbcccdddfffgghhhhjklllmmmnnnnnpprrrrrsssssttttttvwwxyyz";
            string[] vowelafter = { "th", "ch", "sh", "qu" };
            string[] consonantafter = { "oo", "ee" };

            Random rnd = new Random();
            string result = "#";
            bool isvowel = false;

            for (int i = 0; i < length; i++)
            {
                if (isvowel)
                {
                    if (rnd.Next(0, 5) == 0 && i < (length - 1))
                    {
                        result += consonantafter[rnd.Next(0, consonantafter.Length)];
                    }
                    else
                    {
                        result += vowels.Substring(rnd.Next(0, vowels.Length), 1);
                    }
                }
                else
                {
                    if (rnd.Next(0, 5) == 0 && i < (length - 1))
                    {
                        result += vowelafter[rnd.Next(0, vowelafter.Length)];
                    }
                    else
                    {
                        result += consonants.Substring(rnd.Next(0, consonants.Length), 1);
                    }
                }
                isvowel = !isvowel;
            }
            return result;
        }
    }
}
