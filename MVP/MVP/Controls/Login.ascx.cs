using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using MVP.Models;

namespace MVP.Controls
{
    public partial class Login : UserControl, IPostBackEventHandler
    {
        public event EventHandler<SiteMaster.SignInEventArgs> SignIn;

        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            // Enable this once you have account confirmation enabled for password reset functionality
            // ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
            */
        }

        protected void LogIn(object sender, EventArgs e)
        {
            // Validate the user password
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

            // This doen't count login failures towards account lockout
            // To enable password failures to trigger lockout, change to shouldLockout: true
            var result = signinManager.PasswordSignIn(TbLoginEmail.Text, TbLoginPassword.Text, LoginRememberMe.Checked, shouldLockout: false);

            LoginMessage.Visible = false;

            switch (result)
            {
                case SignInStatus.Success:
                    LoginMessage.Text = "Login sucessful";
                    LoginMessage.Visible = true;
                    var userId = signinManager.AuthenticationManager.AuthenticationResponseGrant.Identity.GetUserId();
                    ScriptManager.RegisterStartupScript(upLogin, upLogin.GetType(), "loginPostBackKey", "setTimeout(function(){$.blockUI();__doPostBack('" + UniqueID + "', '" + userId + "');},1);", true);

                    //Response.Redirect(Request.RawUrl);
                    //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                    break;
                case SignInStatus.LockedOut:
                    //Response.Redirect("/Account/Lockout");
                    break;
                case SignInStatus.RequiresVerification:
                    Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
                                                    Request.QueryString["ReturnUrl"],
                                                    LoginRememberMe.Checked),
                                                    true);
                    break;
                case SignInStatus.Failure:
                default:
                    LoginMessage.Text = "Invalid login attempt";
                    LoginMessage.Visible = true;
                    break;
            }
        }

        protected virtual void OnSignIn(string e)
        {
            SignIn?.Invoke(this, new SiteMaster.SignInEventArgs { UserId = e });
        }

        void IPostBackEventHandler.RaisePostBackEvent(string e)
        {

            OnSignIn(e);
        }
    }
}