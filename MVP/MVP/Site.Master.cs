using System;
using System.Collections.Generic;
using System.Globalization;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using MVP.Models.Extensions;
using MVP.Models.Helpers;
using MVP.Services;

namespace MVP
{
    public partial class SiteMaster : MasterPage
    {
        public event EventHandler<EventArgs> PassSignIn;

        public class ExternalLoginEventArgs : EventArgs
        {
            public string Provider;
        }

        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;
        protected string CurrentLanguage;

        protected void Page_Init(object sender, EventArgs e)
        {
            // Load scripts
            ScriptManager mgr = ScriptManager.GetCurrent(this.Page);

            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/Scripts/Custom/google-tag-manager.js") });
            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/Scripts/jquery.blockUI.js") });
            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/Scripts/jquery.sticky.js") });
            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/Scripts/Custom/blockUI-extension.js") });
            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/Scripts/Custom/navbar-scroll.js") });
            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/Scripts/Custom/profile-menu-popover.js") });
            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/Scripts/Custom/show-message.js") });
            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/Scripts/Custom/clipboard-copy.js") });

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
                    throw new InvalidOperationException(Resources.LocalizedText.SiteMaster_Errors_AntiXSRF);
                }
            }

            CurrentLanguage = Resources.LocalizedText.SiteMaster_Footer_Language_Portuguese;
            HttpCookie langCookie = Request.Cookies["langCookie"];
            if (langCookie != null && !string.IsNullOrEmpty(langCookie.Value))
            {
                switch(langCookie.Value)
                {
                    case "en-US":
                        CurrentLanguage = Resources.LocalizedText.SiteMaster_Footer_Language_English;
                        break;
                    case "pt-PT":
                    default:
                        CurrentLanguage = Resources.LocalizedText.SiteMaster_Footer_Language_Portuguese;
                        break;
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string promo = Request.QueryString["promo"];
                if(!string.IsNullOrEmpty(promo))
                {
                    Session["master.promocode"] = promo.ToUpper();
                }
            }

            string error = (string)Session["master.error"];
            if(!string.IsNullOrEmpty(error))
            {
                ApplicationHelpers.ShowMessage(Page, error);
                Session["master.error"] = null;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect("/");
        }

        public void UserSignIn(object sender, EventArgs e)
        {
            GA_Login(Context.User.Identity.GetUserId());
            PassSignIn?.Invoke(this, e);
        }

        protected void ExternalLogin(object sender, ExternalLoginEventArgs e)
        {
            string provider = e.Provider;
            if (string.IsNullOrEmpty(provider))
            {
                return;
            }
            string returnUrl = Request.Url.PathAndQuery;
            string redirectUrl = ResolveUrl(String.Format(CultureInfo.InvariantCulture, "~/Account/RegisterExternalLogin?{0}={1}&returnUrl={2}", IdentityHelper.ProviderNameKey, provider, returnUrl));
            var properties = new AuthenticationProperties()
            {
                RedirectUri = redirectUrl
            };
            if (Context.User.Identity.IsAuthenticated)
            {
                properties.Dictionary[IdentityHelper.XsrfKey] = Context.User.Identity.GetUserId();
            }
            Context.GetOwinContext().Authentication.Challenge(properties, provider);
            Response.StatusCode = 401;
            Response.End();
        }

        protected void btnChangeLangPortuguese_Click(object sender, EventArgs e)
        {
            Response.Cookies["langCookie"].Value = "pt-PT";
            Response.Cookies["langCookie"].Expires = DateTime.Now.AddDays(20);
            Response.Redirect(Request.Url.PathAndQuery);
        }

        protected void btnChangeLangEnglish_Click(object sender, EventArgs e)
        {
            Response.Cookies["langCookie"].Value = "en-US";
            Response.Cookies["langCookie"].Expires = DateTime.Now.AddDays(20);
            Response.Redirect(Request.Url.PathAndQuery);
        }

        public void GA_Login(string userid)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "GA-LoginKey", "GTM_Login('" + userid + "');", true);
        }

        public void GA_Signup(string id, string email, string name)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "GA-SignupKey", "GTM_Signup('" + id + "','" + email + "','" + name + "');", true);
        }

    }
}