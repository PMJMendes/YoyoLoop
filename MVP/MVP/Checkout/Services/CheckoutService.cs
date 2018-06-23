using MVP.Models;
using MVP.Models.Entities;
using MVP.Checkout;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace MVP.Services
{
    public class CheckoutService
    {
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

        public void UpdateBooking(Guid id, BookingStatus status)
        {
            using (var model = new EntityModel())
            {
                var booking = model.Booking.Include(t => t.Trip).SingleOrDefault(b => b.BookingId == id);

                if (booking != null)
                {
                    booking.Status = status;
                    booking.TicketCode = GenerateTicket(10);
                    model.SaveChanges();

                    UpdateTrip(booking.Trip.TripId);
                }
            }
        }

        public void UpdateTrip(Guid id)
        {
            using (var model = new EntityModel())
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
