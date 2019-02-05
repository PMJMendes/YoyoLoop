using System;
using System.Data.Entity;
using System.Security.Claims;
using System.Security.Principal;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using MVP.Models;


namespace MVP.Models.Extensions
{
    public static class IdentityExtensions
    {
        public static string GetUserContactName(this IIdentity identity)
        {
            var claim = ((ClaimsIdentity)identity).FindFirst("ContactName");
            return (claim != null) ? claim.Value : string.Empty;
        }

        public static string GetUserEmail(this IIdentity identity)
        {
            var claim = ((ClaimsIdentity)identity).FindFirst("Email");
            return (claim != null) ? claim.Value : string.Empty;
        }

        public static string GetUserCompany(this IIdentity identity)
        {
            var claim = ((ClaimsIdentity)identity).FindFirst("Company");
            return (claim != null) ? claim.Value : string.Empty;
        }

        public static bool IsAdmin (this IIdentity identity)
        {
            var claim = ((ClaimsIdentity)identity).FindFirst("UserType");
            return (claim != null) ? (claim.Value == ApplicationUser.UserType.ADMIN.ToString()) ? true : false : false;
        }
    }
}