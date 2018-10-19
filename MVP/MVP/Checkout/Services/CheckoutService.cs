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
using System.Globalization;
using MVP.Models.Helpers;
using MVP.Profile.Services;

namespace MVP.Services
{
    public class CheckoutService
    {
        private readonly static string stripePrivateKey = WebConfigurationManager.AppSettings["StripeSecretKey"];
        private readonly StripeCustomerService stripeCustomerService = new StripeCustomerService();
        private readonly StripeCardService stripeCardService = new StripeCardService();
        private readonly StripeChargeService stripeChargeService = new StripeChargeService(stripePrivateKey);
        private readonly InviteService inviteService = new InviteService();
        
        public static object Checkout_Lock = new object();


        public CheckoutDTO GetInitialData(string userid)
        {
            using (var model = new EntityModel())
            {
                var user = model.Users.Include(u => u.ReferredBy)
                                      .Include(c => c.Company)
                                      .FirstOrDefault(u => u.Id == userid);
                var result = new CheckoutDTO
                {
                    UserEmail = user.Email,
                    UserContactName = user.ContactName,
                    StripeCustomerId = user.StripeCustomerId,
                    UserReferredById = user.ReferredBy?.Id,
                    UserMGMCode = user.MGMCode,
                    Corporate = user.Company?.Active ?? false,

                    BillingName = user.BillingName,
                    BillingCompany = user.BillingCompany,
                    BillingNIF = user.BillingNIF,
                    BillingCostCenter = user.BillingCostCenter,
                    BillingAdress = user.BillingAddress,
                    BillingZIP = user.BillingZIP,
                    BillingCity = user.BillingCity,

                    Code = string.Empty
                };

                if (result.Corporate)
                {
                    result.CompanyId = user.Company.CorporateId;
                    result.CompanyName = user.Company.CompanyName;
                }

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
                    if (booking.MGM)
                    {
                        state.UserMGM = CheckUserMGM(state.UserId);
                        state.MGM = CheckMGMCode(state.UserId, state.Code);
                    }
                    state.MGMPrice = booking.Trip.Departure.Route.Fares.SingleOrDefault(f => f.Type == Fare.FareType.MEMBERGETMEMBER).Price;
                    state.Cost = state.MGM || state.UserMGM ? state.MGMPrice + (state.Price * (booking.Seats - 1)) : state.Price * booking.Seats;
                    state.StartTime = booking.Trip.StartTime;
                    state.StartRegionName = booking.Trip.StartAccessPoint.Region.Name;
                    state.StartAPName = booking.Trip.StartAccessPoint.Name;
                    state.EndRegionName = booking.Trip.EndAccessPoint.Region.Name;
                    state.EndAPName = booking.Trip.EndAccessPoint.Name;

                    state.BillingPassengers = new List<ListItem>();
                    for(int i = 0; i < state.Seats; i++)
                    {
                        state.BillingPassengers.Add(new ListItem
                        {
                            Text = "",
                            Value = ""
                        });
                    }
                }
            }
            return state;
        }

        private bool CheckUserMGM(string userid)
        {
            if(inviteService.GetUserMGM(userid) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
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
                MGM = state.MGM,
                UserMGM = state.UserMGM,
                MGMPrice = state.MGMPrice,
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

            if (paneldata.MGM || paneldata.UserMGM)
            {
                result.Add(new BookingPanelDTO.PriceItem
                {
                    Description = Resources.LocalizedText.General_MGMPromo,
                    Value = (paneldata.MGMPrice - paneldata.StandardPrice).ToString("C", ApplicationHelpers.DefaultCulture()),
                    Type = BookingPanelDTO.PriceItemType.DISCOUNT
                });
            }

            if (paneldata.FareType == Fare.FareType.PROMOTIONAL)
            {
                if (paneldata.MGM || paneldata.UserMGM)
                {
                    if(paneldata.Seats > 1)
                    {
                        result.Add(new BookingPanelDTO.PriceItem
                        {
                            Description = Resources.LocalizedText.General_Promocode,
                            Value = ((paneldata.Price - paneldata.StandardPrice) * (paneldata.Seats - 1)).ToString("C", ApplicationHelpers.DefaultCulture()),
                            Type = BookingPanelDTO.PriceItemType.DISCOUNT
                        });
                    }
                }
                else
                {
                    result.Add(new BookingPanelDTO.PriceItem
                    {
                        Description = Resources.LocalizedText.General_Promocode,
                        Value = ((paneldata.Price - paneldata.StandardPrice) * paneldata.Seats).ToString("C", ApplicationHelpers.DefaultCulture()),
                        Type = BookingPanelDTO.PriceItemType.DISCOUNT
                    });
                }
            }

            return result;
        }

        public CheckoutDTO GetStripeCustomerData(CheckoutDTO state)
        {
            state.StripeCardList = new List<ListItem>();

            if (state.Corporate)
            {
                state.StripeCardList.Add(new ListItem
                {
                    Value = "bank_transfer",
                    Text = Resources.LocalizedText.General_BankTransfer
                });
            }

            if (!string.IsNullOrEmpty(state.StripeCustomerId))
            {
                state.StripeCustomerDefaultSourceId = stripeCustomerService.Get(state.StripeCustomerId).DefaultSourceId;

                var cardlist = stripeCardService.List(state.StripeCustomerId);
                var defaultcard = cardlist.FirstOrDefault(c => c.Id == state.StripeCustomerDefaultSourceId);

                if (defaultcard != null)
                {
                    state.StripeCardList.Add(new ListItem
                    {
                        Value = defaultcard.Id,
                        Text = Resources.LocalizedText.General_StripeCard_Card + " " + defaultcard.Brand + " " + Resources.LocalizedText.General_StripeCard_Card_EndingIn + " " + defaultcard.Last4
                    });
                }

                foreach (StripeCard card in cardlist.Where(c => c.Id != state.StripeCustomerDefaultSourceId))
                {
                    state.StripeCardList.Add(new ListItem
                    {
                        Value = card.Id,
                        Text = Resources.LocalizedText.General_StripeCard_Card + " " + card.Brand + " " + Resources.LocalizedText.General_StripeCard_Card_EndingIn + " " + card.Last4
                    });
                }
            }

            state.StripeCardList.Add(new ListItem
            {
                Value = "new",
                Text = Resources.LocalizedText.General_StripeCard_Card_New
            });

            return state;
        }

        public StripeCard GetCard(CheckoutDTO state, string cardid)
        {
            StripeCard result = stripeCardService.Get(state.StripeCustomerId, cardid);
            return result;
        }

        public bool CheckMGMCode(string userid, string code)
        {
            using (var model = new EntityModel())
            {
                if (model.Users.Any(u => u.MGMCode == code && u.Id != userid) && model.Users.Include(u => u.ReferredBy).FirstOrDefault(u => u.Id == userid).ReferredBy == null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public CheckoutDTO CheckPromo(CheckoutDTO state)
        {
            using (var model = new EntityModel())
            {
                bool lastminute = Math.Ceiling((state.StartTime.Date - DateTime.Today).TotalDays) < model.Settings.Select(s => s.LastMinuteThreshold).First();

                if (string.IsNullOrEmpty(state.Promocode))
                {
                    state.MGM = false;
                    state.Code = string.Empty;
                    state.FareType = lastminute ? Fare.FareType.LASTMINUTE : Fare.FareType.STANDARD;
                    state.PromoValid = false;
                }
                else
                {
                    state.MGM = CheckMGMCode(state.UserId, state.Promocode);

                    if(!state.MGM)
                    {
                        state.Code = string.Empty;
                        if (model.Promocode.Any(p => p.Active && p.StartDate <= DateTime.Today && p.EndDate >= DateTime.Today && p.Code.ToUpper() == state.Promocode.ToUpper()))
                        {
                            state.FareType = Fare.FareType.PROMOTIONAL;
                            state.PromoValid = true;
                        }
                        else
                        {
                            state.FareType = lastminute ? Fare.FareType.LASTMINUTE : Fare.FareType.STANDARD;
                            state.PromoValid = false;
                        }
                    }
                    else
                    {
                        state.Code = state.Promocode;
                        state.Promocode = string.Empty;
                    }

                }
                state.Price = model.Booking.Include(b => b.Trip.Departure.Route.Fares).FirstOrDefault(b => b.BookingId == state.BookingId).Trip.Departure.Route.Fares.SingleOrDefault(f => f.Type == state.FareType).Price;
                state.Cost = state.MGM || state.UserMGM ? state.MGMPrice + (state.Price * (state.Seats - 1)) : state.Price * state.Seats;
            }
            return state;
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
                        error = Resources.LocalizedText.Checkout_Service_ProcessPayment_BookingErrorMessage;
                        return false;
                    }
                }

                if(source != "bank_transfer")
                {
                    var myCharge = new StripeChargeCreateOptions
                    {
                        Amount = (int)(state.Cost * 100),
                        Currency = "EUR",
                        Description = state.BookingId.ToString(),
                        SourceTokenOrExistingSourceId = source
                    };

                    if (!string.IsNullOrEmpty(state.StripeCustomerId) && source.Substring(0, 3) != "tok")
                    {
                        myCharge.CustomerId = state.StripeCustomerId;
                    }

                    try
                    {
                        var stripeCharge = stripeChargeService.Create(myCharge);
                        if (stripeCharge != null)
                        {
                            state.StripeChargeID = stripeCharge.Id;
                        }
                    }
                    catch (StripeException ex)
                    {
                        StripeError stripeError = ex.StripeError;
                        error = StripeErrorHandler(stripeError.Code);
                        if (string.IsNullOrEmpty(error))
                        {
                            error = Resources.LocalizedText.Stripe_ErrorHandling_ProcessPayment_Generic;
                        }
                        return false;
                    }
                }
                else
                {
                    state.StripeChargeID = state.CompanyId.ToString();
                }

                // Charge sucessful
                UpdateBooking(state, BookingStatus.BOOKED);

                if (state.MGM)
                {
                    state = CreateReferral(state);
                }

                if (string.IsNullOrEmpty(state.UserReferredById))
                {
                    state = AddSelfReferral(state);
                }

                if (string.IsNullOrEmpty(state.UserMGMCode))
                {
                    state.UserMGMCode = GenerateMGMCode(state.UserId, state.UserEmail);
                }

                error = string.Empty;
                SendInvoice(state);

                return true;
            }
        }

        private CheckoutDTO CreateReferral(CheckoutDTO state)
        {
            using (var model = new EntityModel())
            {
                var user = model.Users.Include(u => u.ReferredBy).FirstOrDefault(u => u.Id == state.UserId);
                var referredby = model.Users.FirstOrDefault(u => u.MGMCode == state.Code);
                state.UserReferredById = referredby.Id;
                user.ReferredBy = referredby;
                model.SaveChanges();
                return state;
            }
        }

        public CheckoutDTO AddSelfReferral(CheckoutDTO state)
        {
            using (var model = new EntityModel())
            {
                var user = model.Users.FirstOrDefault(u => u.Id == state.UserId);
                user.ReferredBy = user;
                state.UserReferredById = state.UserId;
                model.SaveChanges();
            }
            return state;
        }

        public string GenerateMGMCode(string userid, string useremail)
        {
            string strippedid = userid.Replace("-", string.Empty);
            string strippedemail = useremail.Substring(0, useremail.IndexOf("@") - 1).Replace(".", string.Empty);
            string result = strippedemail.Substring(0, Math.Min(strippedemail.Length, 6));
            result += strippedid.Substring(strippedid.Length - (10 - result.Length));
            result = result.ToUpper();

            while (!ValidateMGMCode(result))
            {
                var strippedguid = Guid.NewGuid().ToString().Replace("-", string.Empty);
                result = strippedemail.Substring(0, Math.Min(strippedemail.Length, 6));
                result += strippedguid.Substring(strippedid.Length - (10 - result.Length));
                result = result.ToUpper();
            }

            using (var model = new EntityModel())
            {
                var user = model.Users.FirstOrDefault(u => u.Id == userid);
                user.MGMCode = result;
                model.SaveChanges();
            }
            return result;
        }

        private bool ValidateMGMCode(string code)
        {
            using (var model = new EntityModel())
            {
                var user = model.Users.FirstOrDefault(u => u.MGMCode == code);
                if (user == null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public string StripeErrorHandler(string error)
        {
            string result;

            switch (error)
            {
                case "incorrect_number":
                    result = Resources.LocalizedText.Stripe_ErrorHandling_CardError_incorrect_number;
                    break;
                case "invalid_number":
                    result = Resources.LocalizedText.Stripe_ErrorHandling_CardError_invalid_number;
                    break;
                case "invalid_expiry_month":
                    result = Resources.LocalizedText.Stripe_ErrorHandling_CardError_invalid_expiry_month;
                    break;
                case "invalid_expiry_year":
                    result = Resources.LocalizedText.Stripe_ErrorHandling_CardError_invalid_expiry_year;
                    break;
                case "invalid_cvc":
                    result = Resources.LocalizedText.Stripe_ErrorHandling_CardError_invalid_cvc;
                    break;
                case "expired_card":
                    result = Resources.LocalizedText.Stripe_ErrorHandling_CardError_expired_card;
                    break;
                case "incorrect_cvc":
                    result = Resources.LocalizedText.Stripe_ErrorHandling_CardError_incorrect_cvc;
                    break;
                case "incorrect_zip":
                    result = Resources.LocalizedText.Stripe_ErrorHandling_CardError_incorrect_zip;
                    break;
                case "card_declined":
                    result = Resources.LocalizedText.Stripe_ErrorHandling_CardError_card_declined;
                    break;
                default:
                    result = string.Empty;
                    break;
            }

            return result;
        }

        public bool AddCard(CheckoutDTO state, string stripeToken, out string error)
        {
            if (string.IsNullOrEmpty(state.StripeCustomerId))
            {
                var customerOptions = new StripeCustomerCreateOptions()
                {
                    SourceToken = stripeToken,
                    Description = state.UserContactName + " (" + state.UserEmail + ")",
                    Email = state.UserEmail
                };

                try
                {
                    var customer = stripeCustomerService.Create(customerOptions);
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
                    error = StripeErrorHandler(stripeError.Code);
                    if (string.IsNullOrEmpty(error))
                    {
                        error = Resources.LocalizedText.Stripe_ErrorHandling_PaymentMethodValidation_Generic;
                    }
                    return false;
                }

                if (ProcessPayment(state, state.StripeCustomerDefaultSourceId, out error))
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

                StripeCard card;
                try
                {
                    card = stripeCardService.Create(state.StripeCustomerId, cardOptions);
                }
                catch (StripeException ex)
                {
                    StripeError stripeError = ex.StripeError;
                    error = StripeErrorHandler(stripeError.Code);
                    if (string.IsNullOrEmpty(error))
                    {
                        error = Resources.LocalizedText.Stripe_ErrorHandling_PaymentMethodValidation_Generic;
                    }
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
                var booking = model.Booking.Include(t => t.Trip).SingleOrDefault(b => b.BookingId == state.BookingId);

                if (booking != null)
                {
                    booking.Status = status;
                    booking.TicketCode = GenerateTicket(6);
                    booking.FareType = state.FareType;
                    booking.Promocode = model.Promocode.FirstOrDefault(p => p.Code.ToUpper() == state.Promocode.ToUpper());
                    booking.MGM = state.MGM || state.UserMGM;
                    booking.Cost = state.Cost;
                    booking.StripeChargeId = state.StripeChargeID;

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
                user.BillingCostCenter = state.Invoice.CostCenter;
                user.BillingAddress = state.Invoice.Address;
                user.BillingZIP = state.Invoice.ZIP;
                user.BillingCity = state.Invoice.City;
                model.SaveChanges();
            }
        }

        public void SendInvoice(CheckoutDTO state)
        {
            // THIS IS AN INTERNAL EMAIL - NOT TRANSLATED AT THIS POINT BUT WE MIGHT WANT TO IN THE FUTURE

            SmtpClient client = new SmtpClient();
            using (MailMessage msg = new MailMessage())
            {
                msg.IsBodyHtml = true;
                msg.Subject = "[YOYOLOOP] INVOICE: " + state.BookingId.ToString().Substring(0, 8);

                string body = "Data: " + DateTime.Now.ToString("F", ApplicationHelpers.DefaultCulture());
                body += "<br>Booking ID: " + state.BookingId.ToString();
                body += "<br>User: " + state.UserEmail;
                body += "<br>";
                body += "<br>DETALHES DA VIAGEM:";
                body += "<br>Origem: " + state.StartRegionName + " (" + state.StartAPName + ")";
                body += "<br>Destino: " + state.EndRegionName + " (" + state.EndAPName + ")";
                body += "<br>Hora: " + state.StartTime.ToString("F", ApplicationHelpers.DefaultCulture());
                body += "<br>Lugares: " + state.Seats.ToString();
                body += "<br>";
                body += "<br>DETALHES DO PAGAMENTO:";
                body += "<br>Tarifa: " + state.FareType.ToString();
                if(!string.IsNullOrEmpty(state.Promocode))
                {
                    body += "<br>Promocode: " + state.Promocode.ToUpper() + " (" + (state.PromoValid ? "válido" : "inválido") + ")";
                }
                if (state.UserMGM)
                {
                    body += "<br>MemberGetMember: Sim";
                }
                if(state.MGM)
                {
                    body += "<br>MemberGetMember Referral: Sim";
                    body += "<br>MemberGetMember ReferralCode: " + state.Code;
                }

                if(state.Invoice.PayMethod == "stripe")
                {
                    body += "<br>Stripe link: " + WebConfigurationManager.AppSettings["StripePaymentsURL"] + state.StripeChargeID;
                    body += "<br>Valor pago: " + state.Cost.ToString("C", ApplicationHelpers.DefaultCulture());
                }
                else if(state.Invoice.PayMethod == "bank_transfer")
                {
                    body += "<br>Pagamento por transferência bancária";
                    body += "<br>Empresa: " + state.Invoice.CompanyName + " (" + state.Invoice.CompanyId + ")";
                    body += "<br>Valor a facturar: " + state.Cost.ToString("C", ApplicationHelpers.DefaultCulture());
                }

                if(state.Corporate && state.Invoice.Passengers.Any(p => !string.IsNullOrEmpty(p.Text)))
                {
                    body += "<br>";
                    body += "<br>LISTA DE PASSAGEIROS:";
                    foreach(ListItem item in state.Invoice.Passengers)
                    {
                        if(!string.IsNullOrEmpty(item.Text))
                        {
                            body += "<br>Nome: " + item.Text;
                            if(!string.IsNullOrEmpty(item.Value))
                            {
                                body += " (" + item.Value + ")";
                            }
                        }
                    }
                }

                body += "<br>";
                body += "<br>DADOS DE FACTURAÇÃO:";
                body += "<br>Nome: " + state.Invoice.Name;
                body += "<br>Empresa: " + state.Invoice.Company;
                body += "<br>NIF: " + state.Invoice.NIF;
                if(state.Corporate)
                {
                    body += "<br>Centro de Custo: " + state.Invoice.CostCenter;
                }
                body += "<br>Morada: " + state.Invoice.Address;
                body += "<br>Cód. Postal: " + state.Invoice.ZIP;
                body += "<br>Cidade: " + state.Invoice.City;
                body += "<br>";

                msg.Body = body;

                msg.To.Add(WebConfigurationManager.AppSettings["InvoiceProviderEmail"]);
                msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);

                client.Send(msg);
            }
        }
    }
}
