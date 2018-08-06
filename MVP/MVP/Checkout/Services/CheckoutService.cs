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
using System.Net.Mail;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.IO;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNet.Identity;

namespace MVP.Services
{
    public class CheckoutService
    {
        public static object Checkout_Lock = new object();

        private readonly string stripePrivateKey = WebConfigurationManager.AppSettings["StripeSecretKey"];

        public CheckoutDTO GetInitialData(string userid)
        {
            using (var model = new EntityModel())
            {
                var user = model.Users.FirstOrDefault(u => u.Id == userid);
                var result = new CheckoutDTO
                {
                    UserEmail = user.Email,
                    UserContactName = user.ContactName,
                    StripeCustomerId = user.StripeCustomerId,

                    BillingName = user.BillingName,
                    BillingCompany = user.BillingCompany,
                    BillingNIF = user.BillingNIF,
                    BillingAdress = user.BillingAddress,
                    BillingZIP = user.BillingZIP,
                    BillingCity = user.BillingCity
                };
                return result;
            }
        }

        public CheckoutDTO GetBooking(Guid id, CheckoutDTO state)
        {
            using (var model = new EntityModel())
            {
                var booking = model.Booking.Where(b => b.BookingId == id)
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
                    state = null;
                }
                else
                {
                    state.BookingId = booking.BookingId;
                    state.UserId = booking.UserId;
                    state.BookingStatus = booking.Status;
                    state.Seats = booking.Seats;
                    state.FareType = booking.FareType;
                    state.StandardPrice = booking.Trip.Departure.Route.Fares.SingleOrDefault(f => f.Type == Fare.FareType.STANDARD).Price;
                    state.Price = booking.Trip.Departure.Route.Fares.SingleOrDefault(f => f.Type == booking.FareType).Price;
                    state.Promocode = booking.Promocode?.Code ?? string.Empty;
                    state.PromoValid = booking.FareType == Fare.FareType.PROMOTIONAL ? true : false;
                    state.Cost = booking.Cost;
                    state.StartTime = booking.Trip.StartTime;
                    state.StartRegionName = booking.Trip.StartAccessPoint.Region.Name;
                    state.StartAPName = booking.Trip.StartAccessPoint.Name;
                    state.EndRegionName = booking.Trip.EndAccessPoint.Region.Name;
                    state.EndAPName = booking.Trip.EndAccessPoint.Name;
                }
            }
            return state;
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
            result.PriceSummary = GetPriceSummary(result);

            return result;
        }

        public List<BookingPanelDTO.PriceItem> GetPriceSummary(BookingPanelDTO paneldata)
        {
            var result = new List<BookingPanelDTO.PriceItem>();

            if (paneldata.FareType == Fare.FareType.PROMOTIONAL)
            {
                result.Add(new BookingPanelDTO.PriceItem
                {
                    Description = "Promocode",
                    Value = ((paneldata.Price - paneldata.StandardPrice) * paneldata.Seats).ToString("C"),
                    Type = BookingPanelDTO.PriceItemType.DISCOUNT
                });
            }

            return result;
        }

        public CheckoutDTO GetStripeCustomerData(CheckoutDTO state)
        {
            state.StripeCardList = new List<ListItem>();
            if (!string.IsNullOrEmpty(state.StripeCustomerId))
            {
                state.StripeCustomerDefaultSourceId = new StripeCustomerService().Get(state.StripeCustomerId).DefaultSourceId;

                var cardlist = new StripeCardService().List(state.StripeCustomerId);
                var defaultcard = cardlist.FirstOrDefault(c => c.Id == state.StripeCustomerDefaultSourceId);

                if (defaultcard != null)
                {
                    state.StripeCardList.Add(new ListItem
                    {
                        Value = defaultcard.Id,
                        Text = "Cartão " + defaultcard.Brand + " terminado em " + defaultcard.Last4
                    });
                }

                foreach (StripeCard card in cardlist.Where(c => c.Id != state.StripeCustomerDefaultSourceId))
                {
                    state.StripeCardList.Add(new ListItem
                    {
                        Value = card.Id,
                        Text = "Cartão " + card.Brand + " terminado em " + card.Last4
                    });
                }
            }

            state.StripeCardList.Add(new ListItem
            {
                Value = "new",
                Text = "Novo cartão de crédito"
            });

            return state;
        }

        public StripeCard GetCard(CheckoutDTO state, string cardid)
        {
            var cardService = new StripeCardService();
            StripeCard result = cardService.Get(state.StripeCustomerId, cardid);
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

        public bool ProcessPayment(CheckoutDTO state, string source, out string error)
        {
            lock (Checkout_Lock)
            {
                using (var model = new EntityModel())
                {
                    var threshold = DateTime.Now + model.Settings.Select(s => s.MinTimeBookLastMinute).First();
                    var booking = model.Booking.Include(b => b.Trip).SingleOrDefault(b => b.BookingId == state.BookingId && b.Status == BookingStatus.PENDING && b.Trip.StartTime > threshold);
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
                    SourceTokenOrExistingSourceId = source
                };

                if(!string.IsNullOrEmpty(state.StripeCustomerId) && source.Substring(0, 3) != "tok")
                {
                    myCharge.CustomerId = state.StripeCustomerId;
                }

                var chargeService = new StripeChargeService(stripePrivateKey);

                try
                {
                    var stripeCharge = chargeService.Create(myCharge);
                    if(stripeCharge != null)
                    {
                        state.StripeChargeID = stripeCharge.Id;
                    }
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
                SendInvoice(state);
                return true;
            }
        }

        public bool AddCard(CheckoutDTO state, string stripeToken, out string error)
        {
            if (string.IsNullOrEmpty(state.StripeCustomerId))
            {
                var customerOptions = new StripeCustomerCreateOptions()
                {
                    SourceToken = stripeToken,
                    Description = state.UserContactName + "(" + state.UserEmail + ")",
                    Email = state.UserEmail
                };

                var customerService = new StripeCustomerService();

                try
                {
                    var customer = customerService.Create(customerOptions);
                    if (customer != null)
                    {
                        state.StripeCustomerId = customer.Id;
                        state.StripeCustomerDefaultSourceId = customer.DefaultSourceId;
                        using (var model = new EntityModel())
                        {
                            var user = model.Users.FirstOrDefault(u => u.Id == state.UserId);
                            user.StripeCustomerId = customer.Id;
                            model.SaveChanges();
                        }
                    }
                }
                catch (StripeException ex)
                {
                    StripeError stripeError = ex.StripeError;
                    error = stripeError.ErrorType;
                    return false;
                }

                if(ProcessPayment(state, state.StripeCustomerDefaultSourceId, out error))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                var cardOptions = new StripeCardCreateOptions()
                {
                    SourceToken = stripeToken
                };

                var cardService = new StripeCardService();
                StripeCard card;
                try
                {
                    card = cardService.Create(state.StripeCustomerId, cardOptions);
                }
                catch (StripeException ex)
                {
                    StripeError stripeError = ex.StripeError;
                    error = stripeError.ErrorType;
                    return false;
                }

                if (ProcessPayment(state, card.Id, out error))
                {
                    return true;
                }
                else
                {
                    return false;
                }
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
                state.TicketCode = booking.TicketCode;
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

        public void SaveBillingDetails(CheckoutDTO state)
        {
            using (var model = new EntityModel())
            {
                var user = model.Users.FirstOrDefault(u => u.Id == state.UserId);
                user.BillingName = state.Invoice.Name;
                user.BillingCompany = state.Invoice.Company;
                user.BillingNIF = state.Invoice.NIF;
                user.BillingAddress = state.Invoice.Address;
                user.BillingZIP = state.Invoice.ZIP;
                user.BillingCity = state.Invoice.City;
                model.SaveChanges();
            }
        }

        public void SendInvoice(CheckoutDTO state)
        {
            SmtpClient client = new SmtpClient();
            using (MailMessage msg = new MailMessage())
            {
                msg.IsBodyHtml = false;
                msg.Subject = "[YOYOLOOP] INVOICE: " + state.BookingId.ToString().Substring(0, 8);

                string body = "Data: " + DateTime.Now.ToString("R");
                body += "\r\nBooking ID: " + state.BookingId.ToString();
                body += "\r\nUser: " + state.UserEmail;
                body += "\r\n";
                body += "\r\nDETALHES DA VIAGEM:";
                body += "\r\nOrigem: " + state.StartRegionName + " (" + state.StartAPName + ")";
                body += "\r\nDestino: " + state.EndRegionName + " (" + state.EndAPName + ")";
                body += "\r\nHora: " + state.StartTime.ToString("R");
                body += "\r\nLugares: " + state.Seats.ToString();
                body += "\r\n";
                body += "\r\nDETALHES DO PAGAMENTO:";
                body += "\r\nTarifa: " + state.FareType.ToString();
                body += "\r\nPromocode: " + state.Promocode.ToUpper() + " (" + (state.PromoValid ? "válido" : "inválido") + ")";
                body += "\r\nStripe link: " + WebConfigurationManager.AppSettings["StripePaymentsURL"] + state.StripeChargeID;
                body += "\r\nValor pago: " + state.Cost.ToString() + "€";
                body += "\r\n";
                body += "\r\nDADOS DE FACTURAÇÃO:";
                body += "\r\nNome: " + state.Invoice.Name;
                body += "\r\nEmpresa: " + state.Invoice.Company;
                body += "\r\nNIF: " + state.Invoice.NIF;
                body += "\r\nMorada: " + state.Invoice.Address;
                body += "\r\nCód. Postal: " + state.Invoice.ZIP;
                body += "\r\nCidade: " + state.Invoice.City;
                body += "\r\n";

                msg.Body = body;

                msg.To.Add(WebConfigurationManager.AppSettings["InvoiceProviderEmail"]);
                msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);

                client.Send(msg);
            }
        }
    }
}
