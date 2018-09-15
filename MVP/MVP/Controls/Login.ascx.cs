using System;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using MVP.Services;


namespace MVP.Controls
{
    public partial class Login : UserControl, IPostBackEventHandler
    {
        private readonly MasterService service = new MasterService();
        public string ReturnUrl { get; set; }

        public event EventHandler<EventArgs> SignIn;

        protected void LogIn_Click(object sender, EventArgs e)
        {
            LoginMessage.Visible = false;

            var result = service.LogIn(Context.GetOwinContext(), TbLoginEmail.Text, TbLoginPassword.Text, LoginRememberMe.Checked);

            switch (result)
            {
                case SignInStatus.Success:
                    LoginMessage.Text = Resources.LocalizedText.Controls_Login_LoginMessageSucess_Text;
                    LoginMessage.Visible = true;
                    ScriptManager.RegisterStartupScript(upLogin, upLogin.GetType(), "loginPostBackKey", "setTimeout(function(){$.blockUI();__doPostBack('" + UniqueID + "', '');},1);", true);
                    break;
                case SignInStatus.LockedOut:
                    //Response.Redirect("/Account/Lockout");
                    break;
                case SignInStatus.RequiresVerification:
                    //Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
                    //                                Request.QueryString["ReturnUrl"],
                    //                                LoginRememberMe.Checked),
                    //                                true);
                    break;
                case SignInStatus.Failure:
                default:
                    LoginMessage.Text = Resources.LocalizedText.Controls_Login_LoginMessageFailure_Text;
                    LoginMessage.Visible = true;
                    break;
            }
        }

        protected virtual void OnSignIn(string e)
        {
            SignIn?.Invoke(this, new EventArgs ());
        }

        void IPostBackEventHandler.RaisePostBackEvent(string e)
        {

            OnSignIn(e);
        }

        protected void btnLoginFacebook_ServerClick(object sender, EventArgs e)
        {
            string provider = "Facebook";
            // Request a redirect to the external login provider
            string redirectUrl = ResolveUrl(String.Format(CultureInfo.InvariantCulture, "~/Account/RegisterExternalLogin?{0}={1}&returnUrl={2}", IdentityHelper.ProviderNameKey, provider, ReturnUrl));
            var properties = new AuthenticationProperties() { RedirectUri = redirectUrl };
            // Add xsrf verification when linking accounts
            if (Context.User.Identity.IsAuthenticated)
            {
                properties.Dictionary[IdentityHelper.XsrfKey] = Context.User.Identity.GetUserId();
            }
            Context.GetOwinContext().Authentication.Challenge(properties, provider);
            Response.StatusCode = 401;
            Response.End();
        }
    }
}