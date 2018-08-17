using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using MVP.Models;
using MVP.Services;

namespace MVP.Controls
{
    public partial class Forgot : System.Web.UI.UserControl
    {
        private readonly MasterService service = new MasterService();

        protected void btnForgot_Click(object sender, EventArgs e)
        {
            ErrorMessage.Visible = false;
            DisplayEmail.Visible = false;

            // Validate the user's email address
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            ApplicationUser user = manager.FindByName(TbForgotEmail.Text);
            if (user == null)
            {
                FailureText.Text = Resources.LocalizedText.Controls_Forgot_ResultMessage_Failure;
                ErrorMessage.Visible = true;
                return;
            }

            string code = manager.GeneratePasswordResetToken(user.Id);
            string callbackUrl = IdentityHelper.GetResetPasswordRedirectUrl(code, Request);
            string homepageUrl = Request.Url.Scheme + "://" + Request.Url.Authority;
            service.SendResetPassword(user.Email, callbackUrl, homepageUrl);
            DisplayEmail.Visible = true;
            btnForgot.Enabled = false;
            ScriptManager.RegisterStartupScript(upForgot, upForgot.GetType(), "forgotPostBackKey", "__doPostBack('" + UniqueID + "', '');", true);
        }
    }
}