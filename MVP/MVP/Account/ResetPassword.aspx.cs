using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using MVP.Models;

namespace MVP.Account
{
    public partial class ResetPassword : Page
    {
        protected string StatusMessage
        {
            get;
            private set;
        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            string code = IdentityHelper.GetCodeFromRequest(Request);
            if (code != null)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

                var user = manager.FindByName(Email.Text);
                if (user == null)
                {
                    FormPanel.Visible = false;
                    errorPanel.Visible = true;
                    successPanel.Visible = false;
                    ErrorMessage.Text = "No user found.";
                    return;
                }
                var result = manager.ResetPassword(user.Id, code, Password.Text);
                if (result.Succeeded)
                {
                    FormPanel.Visible = false;
                    errorPanel.Visible = false;
                    successPanel.Visible = true;

                    var service = new Services.MasterService();
                    service.ForceLogIn(Context.GetOwinContext(), user.Id);
                    (this.Master as SiteMaster).GA_Login(user.Id);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectKey", "setTimeout(function(){location.href = '/Default.aspx';}, 5000);", true);
                    return;
                }
                FormPanel.Visible = false;
                errorPanel.Visible = true;
                successPanel.Visible = false;
                ErrorMessage.Text = result.Errors.FirstOrDefault();
                return;
            }

            FormPanel.Visible = false;
            errorPanel.Visible = true;
            successPanel.Visible = false;
            ErrorMessage.Text = Resources.LocalizedText.Account_ResetPassword_ErrorMessage;
        }
    }
}