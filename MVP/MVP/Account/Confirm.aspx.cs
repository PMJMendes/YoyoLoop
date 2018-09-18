using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using MVP.Models;
using System.Web.UI.WebControls;

namespace MVP.Account
{
    public partial class Confirm : Page
    {
        protected string StatusMessage
        {
            get;
            private set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string code = IdentityHelper.GetCodeFromRequest(Request);
            string userId = IdentityHelper.GetUserIdFromRequest(Request);
            string book = HttpUtility.UrlDecode(Request.QueryString["bookid"]);

            if(string.IsNullOrEmpty(code) || string.IsNullOrEmpty(userId))
            {
                successPanel.Visible = false;
                waitPanel.Visible = false;
                errorPanel.Visible = true;
                return;
            }

            if (User?.Identity.IsAuthenticated == false)
            {
                ShowLogin(GetUserEmail(userId));
                successPanel.Visible = false;
                waitPanel.Visible = true;
                errorPanel.Visible = false;
                return;
            }

            if (User?.Identity.GetUserId() != userId)
            {
                Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
                successPanel.Visible = false;
                waitPanel.Visible = true;
                errorPanel.Visible = false;
                // Just logging the user out with Authentication.Signout is not enough. I need a new request to refresh the context. 
                // Since the user is now logged out it will trigger the IsAuthenticated == false above.
                Response.Redirect(Request.Url.PathAndQuery);
                return;
            }

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var result = manager.ConfirmEmail(userId, code);
            if (result.Succeeded)
            {
                successPanel.Visible = true;
                waitPanel.Visible = false;
                if (string.IsNullOrEmpty(book))
                {
                    redirectPanel.Visible = false;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectKey", "setTimeout(function(){location.href = '/';}, 5000);", true);
                    return;
                }
                else
                {
                    redirectPanel.Visible = true;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectKey", "setTimeout(function(){location.href = '/Confirm/Confirm?Id=" + book + "';}, 5000);", true);
                    return;
                }
            }
        }

        private string GetUserEmail(string userId)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var result = manager.GetEmail(userId);
            return result;
        }

        private void ShowLogin(string userEmail)
        {
            var login = (this.Master as SiteMaster).FindControl("login");
            TextBox login_TbLoginEmail = (TextBox)login.FindControl("TbLoginEmail");
            login_TbLoginEmail.Text = userEmail;
            ScriptManager.RegisterStartupScript(this, GetType(), "showLoginModalKey", "$('#loginModal').modal('show');", true);
        }
    }
}