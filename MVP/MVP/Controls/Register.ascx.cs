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
    public partial class Register : System.Web.UI.UserControl
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = TbRegisterEmail.Text, Email = TbRegisterEmail.Text };
            IdentityResult result = manager.Create(user, TbRegisterPassword.Text);
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                RegisterErrorMessage.Text = "Registration sucessful";

                ScriptManager.RegisterStartupScript(upRegister, upRegister.GetType(), "registerPostBackKey", "__doPostBack();", true);
                //This postback needs to raise an event on the Site.Master to key the previous viewstate to the newly signed in user before doing the AntiXsrf check

                //Response.Redirect(Request.RawUrl);
                //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                RegisterErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}