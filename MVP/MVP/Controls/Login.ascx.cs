using System;
using System.Web.UI;
using Microsoft.AspNet.Identity.Owin;
using MVP.Services;

namespace MVP.Controls
{
    public partial class Login : UserControl, IPostBackEventHandler
    {
        private readonly MasterService service = new MasterService();

        public event EventHandler<EventArgs> SignIn;

        protected void LogIn_Click(object sender, EventArgs e)
        {
            LoginMessage.Visible = false;

            var result = service.LogIn(Context, TbLoginEmail.Text, TbLoginPassword.Text, LoginRememberMe.Checked);

            switch (result)
            {
                case SignInStatus.Success:
                    LoginMessage.Text = "Login sucessful";
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
                    LoginMessage.Text = "Invalid login attempt";
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
    }
}