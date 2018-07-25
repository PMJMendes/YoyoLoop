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
                var result = new ProfileDTO {
                    UserId = user.Id,
                    ContactName = user.ContactName,
                    //BirthDate = user.BirthDate,
                    Email = user.Email,
                    EmailConfirmed = user.EmailConfirmed,
                    //PhoneCountryCode = user.PhoneCountryCode,
                    PhoneNumber = user.PhoneNumber
                };
                return result;
            }
        }
    }
}
