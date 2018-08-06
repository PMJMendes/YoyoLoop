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
        public ProfileDTO GetInitialData(string userid)
        {
            using (var model = new EntityModel())
            {
                var user = model.Users.FirstOrDefault(u => u.Id == userid);
                var result = new ProfileDTO
                {
                    UserId = user.Id,
                    ContactName = user.ContactName,
                    BirthDate = user.BirthDate == DateTime.MinValue ? string.Empty : user.BirthDate.ToString("dd/MM/yyyy"),
                    Email = user.Email,
                    EmailConfirmed = user.EmailConfirmed,
                    //PhoneCountryCode = user.PhoneCountryCode,
                    PhoneNumber = user.PhoneNumber,
                    PhoneNumberConfirmed = user.PhoneNumberConfirmed,

                    BillingName = user.BillingName,
                    BillingCompany = user.BillingCompany,
                    BillingNIF = user.BillingNIF,
                    BillingAddress = user.BillingAddress,
                    BillingZIP = user.BillingZIP,
                    BillingCity = user.BillingCity,

                    StripeCustomerId = user.StripeCustomerId,
                };
                return result;
            }
        }

        public ProfileDTO GetStripeCustomerData(ProfileDTO state)
        {
            state.StripeCardList = new List<ListItem>();
            if (!string.IsNullOrEmpty(state.StripeCustomerId))
            {
                state.StripedCustomerDefaultSourceId = new StripeCustomerService().Get(state.StripeCustomerId).DefaultSourceId;

                var cardlist = new StripeCardService().List(state.StripeCustomerId);
                var defaultcard = cardlist.FirstOrDefault(c => c.Id == state.StripedCustomerDefaultSourceId);

                if (defaultcard != null)
                {
                    state.StripeCardList.Add(new ListItem
                    {
                        Value = defaultcard.Id,
                        Text = "Cartão " + defaultcard.Brand + " terminado em " + defaultcard.Last4
                    });
                }

                foreach (StripeCard card in cardlist.Where(c => c.Id != state.StripedCustomerDefaultSourceId))
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

        public StripeCard GetCard(ProfileDTO state, string cardid)
        {
            var cardService = new StripeCardService();
            StripeCard result = cardService.Get(state.StripeCustomerId, cardid);
            return result;
        }

        public bool AddCard(ProfileDTO state, string stripeToken, out string error)
        {
            if(string.IsNullOrEmpty(state.StripeCustomerId))
            {
                var customerOptions = new StripeCustomerCreateOptions()
                {
                    SourceToken = stripeToken,
                    Description = state.ContactName + "(" + state.Email + ")",
                    Email = state.Email
                };

                var customerService = new StripeCustomerService();

                try
                {
                    var customer = customerService.Create(customerOptions);
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
                    error = stripeError.ErrorType;
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

                try
                {
                    cardService.Create(state.StripeCustomerId, cardOptions);
                }
                catch (StripeException ex)
                {
                    StripeError stripeError = ex.StripeError;
                    error = stripeError.ErrorType;
                    return false;
                }
            }

            error = string.Empty;
            return true;
        }

        public bool RemoveCard(ProfileDTO state, string cardid, out string error)
        {
            var cardService = new StripeCardService();

            try
            {
                StripeDeleted card = cardService.Delete(state.StripeCustomerId, cardid);
            }
            catch (StripeException ex)
            {
                StripeError stripeError = ex.StripeError;
                error = stripeError.ErrorType;
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
                    error = "A data introduzida é invalida";
                    return false;
                }
            }

            var cardOptions = new StripeCardUpdateOptions()
            {
                Name = name,
                ExpirationMonth = date.Month,
                ExpirationYear = date.Year
            };
            var cardService = new StripeCardService();

            try
            {
                StripeCard card = cardService.Update(state.StripeCustomerId, cardid, cardOptions);
            }
            catch (StripeException ex)
            {
                StripeError stripeError = ex.StripeError;
                error = stripeError.ErrorType;
                return false;
            }

            if(defaultsource && cardid != state.StripedCustomerDefaultSourceId)
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

            var customerService = new StripeCustomerService();

            try
            {
                StripeCustomer customer = customerService.Update(state.StripeCustomerId, customerOptions);
                state.StripedCustomerDefaultSourceId = customer.DefaultSourceId;
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
                user.BirthDate = DateTime.Parse(state.BirthDate);
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
