using MVP.Models;
using MVP.Models.Entities;
using MVP.Profile;
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
    public class ProfileService
    {
        private readonly StripeCustomerService stripeCustomerService = new StripeCustomerService();
        private readonly StripeCardService stripeCardService = new StripeCardService();
        private readonly CheckoutService checkoutService = new CheckoutService();

        public ProfileDTO GetInitialData(string userid)
        {
            using (var model = new EntityModel())
            {
                var user = model.Users.Include(c => c.Company).FirstOrDefault(u => u.Id == userid);
                var result = new ProfileDTO
                {
                    UserId = user.Id,
                    ContactName = user.ContactName,
                    BirthDate = user.BirthDate == DateTime.MinValue ? string.Empty : user.BirthDate.ToString("yyyy/MM/dd"),
                    Email = user.Email,
                    EmailConfirmed = user.EmailConfirmed,
                    //PhoneCountryCode = user.PhoneCountryCode,
                    PhoneNumber = user.PhoneNumber,
                    PhoneNumberConfirmed = user.PhoneNumberConfirmed,
                    Corporate = user.Company?.Active ?? false,

                    BillingName = user.BillingName,
                    BillingCompany = user.BillingCompany,
                    BillingNIF = user.BillingNIF,
                    BillingCostCenter = user.BillingCostCenter,
                    BillingAddress = user.BillingAddress,
                    BillingZIP = user.BillingZIP,
                    BillingCity = user.BillingCity,

                    StripeCustomerId = user.StripeCustomerId
                };

                return result;
            }
        }

        public ProfileDTO GetStripeCustomerData(ProfileDTO state)
        {
            state.StripeCardList = new List<ListItem>();

            if(state.Corporate)
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

        public StripeCard GetCard(ProfileDTO state, string cardid)
        {
            StripeCard result = stripeCardService.Get(state.StripeCustomerId, cardid);
            return result;
        }

        public bool AddCard(ProfileDTO state, string stripeToken, out string error)
        {
            if(string.IsNullOrEmpty(state.StripeCustomerId))
            {
                var customerOptions = new StripeCustomerCreateOptions()
                {
                    SourceToken = stripeToken,
                    Description = state.ContactName + " (" + state.Email + ")",
                    Email = state.Email
                };

                try
                {
                    var customer = stripeCustomerService.Create(customerOptions);
                    if(customer != null)
                    {
                        state.StripeCustomerId = customer.Id;
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
                    error = checkoutService.StripeErrorHandler(stripeError.Code);
                    if (string.IsNullOrEmpty(error))
                    {
                        error = Resources.LocalizedText.Stripe_ErrorHandling_PaymentMethodValidation_Generic;
                    }
                    return false;
                }
            }
            else
            {
                var cardOptions = new StripeCardCreateOptions()
                {
                    SourceToken = stripeToken
                };

                try
                {
                    stripeCardService.Create(state.StripeCustomerId, cardOptions);
                }
                catch (StripeException ex)
                {
                    StripeError stripeError = ex.StripeError;
                    error = checkoutService.StripeErrorHandler(stripeError.Code);
                    if (string.IsNullOrEmpty(error))
                    {
                        error = Resources.LocalizedText.Stripe_ErrorHandling_PaymentMethodValidation_Generic;
                    }
                    return false;
                }
            }

            error = string.Empty;
            return true;
        }

        public bool RemoveCard(ProfileDTO state, string cardid, out string error)
        {
            try
            {
                StripeDeleted card = stripeCardService.Delete(state.StripeCustomerId, cardid);
            }
            catch (StripeException ex)
            {
                StripeError stripeError = ex.StripeError;
                error = checkoutService.StripeErrorHandler(stripeError.Code);
                if (string.IsNullOrEmpty(error))
                {
                    error = Resources.LocalizedText.Stripe_ErrorHandling_PaymentMethodValidation_Generic;
                }
                return false;
            }

            error = string.Empty;
            return true;
        }

        public bool UpdateCard(ProfileDTO state, string cardid, string name, string expire, bool defaultsource, out string error)
        {
            DateTime date;
            if(!DateTime.TryParseExact(expire, "MM/yy", null, System.Globalization.DateTimeStyles.None, out date))
            {
                if(!DateTime.TryParseExact(expire, "MM/yyyy", null, System.Globalization.DateTimeStyles.None, out date))
                {
                    error = Resources.LocalizedText.Stripe_ErrorHandling_CardError_invalid_date_format;
                    return false;
                }
            }

            var cardOptions = new StripeCardUpdateOptions()
            {
                Name = name,
                ExpirationMonth = date.Month,
                ExpirationYear = date.Year
            };

            try
            {
                StripeCard card = stripeCardService.Update(state.StripeCustomerId, cardid, cardOptions);
            }
            catch (StripeException ex)
            {
                StripeError stripeError = ex.StripeError;
                error = checkoutService.StripeErrorHandler(stripeError.Code);
                if (string.IsNullOrEmpty(error))
                {
                    error = Resources.LocalizedText.Stripe_ErrorHandling_PaymentMethodValidation_Generic;
                }
                return false;
            }

            if(defaultsource && cardid != state.StripeCustomerDefaultSourceId)
            {
                UpdateDefaultSource(state, cardid);
            }

            error = string.Empty;
            return true;
        }

        protected ProfileDTO UpdateDefaultSource(ProfileDTO state, string cardid)
        {
            var customerOptions = new StripeCustomerUpdateOptions()
            {
                DefaultSource = cardid
            };

            try
            {
                StripeCustomer customer = stripeCustomerService.Update(state.StripeCustomerId, customerOptions);
                state.StripeCustomerDefaultSourceId = customer.DefaultSourceId;
            }
            catch (StripeException)
            {
                return state;
            }

            return state;
        }

        public void UpdatePersonalDetails(ProfileDTO state)
        {
            using (var model = new EntityModel())
            {
                var user = model.Users.FirstOrDefault(u => u.Id == state.UserId);
                user.ContactName = state.ContactName;
                DateTime birthdate;
                if(DateTime.TryParse(state.BirthDate, out birthdate))
                {
                    user.BirthDate = birthdate;
                }
                user.PhoneNumber = state.PhoneNumber;
                model.SaveChanges();
            }
        }

        public void UpdateBillingDetails(ProfileDTO state)
        {
            using (var model = new EntityModel())
            {
                var user = model.Users.FirstOrDefault(u => u.Id == state.UserId);
                user.BillingName = state.BillingName;
                user.BillingCompany = state.BillingCompany;
                user.BillingNIF = state.BillingNIF;
                user.BillingCostCenter = state.BillingCostCenter;
                user.BillingAddress = state.BillingAddress;
                user.BillingZIP = state.BillingZIP;
                user.BillingCity = state.BillingCity;
                model.SaveChanges();
            }
        }

        public void ChangeEmail(string userid, string newemail)
        {
            using (var model = new EntityModel())
            {
                var user = model.Users.FirstOrDefault(u => u.Id == userid);
                user.UserName = newemail;
                user.Email = newemail;
                user.EmailConfirmed = false;
                model.SaveChanges();
            }
        }
    }
}
