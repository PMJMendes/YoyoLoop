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
                    BillingCity = user.BillingCity
                };
                return result;
            }
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
