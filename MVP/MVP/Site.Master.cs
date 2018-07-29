using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using MVP.Models.Extensions;
using MVP.Services;

namespace MVP
{
    public partial class SiteMaster : MasterPage
    {
        public event EventHandler<EventArgs> PassSignIn;

        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // Load scripts
            ScriptManager mgr = ScriptManager.GetCurrent(this.Page);

            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/Scripts/jquery.blockUI.js") });
            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/Scripts/jquery.sticky.js") });
            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/Scripts/Custom/blockUI-extension.js") });
            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/Scripts/Custom/navbar-scroll.js") });
            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/Scripts/Custom/profile-menu-popover.js") });
            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/Scripts/Custom/scrollbar-register.js") });

            // Check if update service has been running
            var service = new MasterService();
            service.CheckUpdater(Request.Url.GetLeftPart(UriPartial.Authority));

            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                if((string)ViewState[AntiXsrfUserNameKey] == String.Empty)
                {
                    ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
                }
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect("/");
        }

        protected void UserSignIn(object sender, EventArgs e)
        {
            PassSignIn?.Invoke(this, e);
        }

    }
}