using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MVP.Services;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using MVP.Models.Helpers;

namespace MVP.Profile
{
    public partial class Profile : System.Web.UI.Page
    {
        private readonly ProfileService service = new ProfileService();
        protected ProfileDTO pageData;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (User?.Identity.IsAuthenticated == false)
            {
                Response.Redirect("/");
            }
            InitData();
        }

        private void InitData()
        {
            pageData = null;

            if (IsPostBack)
            {
                pageData = (ProfileDTO)Session["profile.data"];
            }

            if (pageData == null)
            {
                pageData = service.GetInitialData(User?.Identity.GetUserId());
                Session["profile.data"] = pageData;
                InitializeControls();
            }
        }

        private void InitializeControls()
        {
            txtName.Text = pageData.ContactName;
            txtBirthDate.Text = pageData.BirthDate;
            lbEmail.Text = pageData.Email;
            txtPhoneNumber.Text = pageData.PhoneNumber;
        }

        protected void btnConfirmEmail_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            string code = manager.GenerateEmailConfirmationToken(pageData.UserId);
            string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, pageData.UserId, Request);
            var masterservice = new MasterService();
            masterservice.SendEmailConfirmation(pageData.Email, callbackUrl);
            ApplicationHelpers.ShowMessage(this, "Enviámos um email para <span style='color: #ff5f6d;'>" + pageData.Email + "</span> com o link para poderes confirmar o teu email.");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect("/");
        }

        protected void btnProfileSave_Click(object sender, EventArgs e)
        {
            pageData.ContactName = txtName.Text;
            pageData.BirthDate = txtBirthDate.Text;
            pageData.PhoneNumber = txtPhoneNumber.Text;
            service.UpdatePersonalDetails(pageData);
            ApplicationHelpers.ShowMessage(this, "Os teus dados foram actualizados com sucesso.");
        }

        protected void btnEmailSave_Click(object sender, EventArgs e)
        {
            string password = tbChangeEmailPassword.Text;
            string newemail = txtChangeEmail.Text;
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = manager.FindById(User.Identity.GetUserId());
            if(manager.CheckPassword(user, password))
            {
                service.ChangeEmail(user.Id, newemail);
                string code = manager.GenerateEmailConfirmationToken(user.Id);
                string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                var masterservice = new MasterService();
                masterservice.SendEmailConfirmation(newemail, callbackUrl);
                ApplicationHelpers.ShowMessage(this, "O teu endereço de email foi alterado com sucesso.<br/><br/>Enviámos um email para <span style='color: #ff5f6d;'>" + newemail + "</span> com um link para poderes confirmar o novo email.");
            }
            else
            {
                ApplicationHelpers.ShowMessage(this, "A password que introduziste está incorreta.");
            }
        }

        protected void btnPasswordSave_Click(object sender, EventArgs e)
        {
            string currentpassword = tbChangePasswordCurrentPassword.Text;
            string newpassword = tbChangePasswordNewPassword.Text;
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = manager.FindById(User.Identity.GetUserId());
            if (manager.CheckPassword(user, currentpassword))
            {
                if(manager.ChangePassword(user.Id, currentpassword, newpassword).Succeeded)
                {
                    ApplicationHelpers.ShowMessage(this, "A tua password foi alterada com sucesso.");
                }
                else
                {
                    ApplicationHelpers.ShowMessage(this, "Ocorreu um erro ao alterar a tua password.<br/><br/>Tenta outra vez ou <a href='#' style='color: #ff5f6d;'>contacta-nos</a>.");
                }
            }
            else
            {
                ApplicationHelpers.ShowMessage(this, "A password que introduziste está incorreta.");
            }
        }
    }
}