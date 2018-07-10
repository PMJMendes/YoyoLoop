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
    public partial class Register : UserControl, IPostBackEventHandler
    {
        public event EventHandler<SiteMaster.SignInEventArgs> SignIn;

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = TbRegisterEmail.Text, Email = TbRegisterEmail.Text, ContactName = TbRegisterName.Text };
            IdentityResult result = manager.Create(user, TbRegisterPassword.Text);
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                RegisterErrorMessage.Text = "Registration sucessful";
                var userId = signInManager.AuthenticationManager.AuthenticationResponseGrant.Identity.GetUserId();

                ScriptManager.RegisterStartupScript(upRegister, upRegister.GetType(), "registerPostBackKey", "__doPostBack('" + UniqueID + "', '" + userId + "'); ", true);

                //Response.Redirect(Request.RawUrl);
                //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                RegisterErrorMessage.Text = result.Errors.FirstOrDefault();
                ScriptManager.RegisterStartupScript(upRegister, upRegister.GetType(), "registerFailedKey", "$.unblockUI();", true);
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