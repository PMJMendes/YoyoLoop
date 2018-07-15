using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using MVP.Models;

namespace MVP.Services
{
    public class MasterService
    {
        public SignInStatus LogIn (HttpContext context, string email, string password, bool rememberme)
        {
            var manager = context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signinManager = context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

            // This doen't count login failures towards account lockout
            // To enable password failures to trigger lockout, change to shouldLockout: true
            var result = signinManager.PasswordSignIn(email, password, rememberme, shouldLockout: false);

            return result;
        }

        public IdentityResult CreateUser (HttpContext context, HttpRequest request, string email, string password, string contactname)
        {
            var manager = context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = email, Email = email, ContactName = contactname };
            IdentityResult result = manager.Create(user, password);
            if (result.Succeeded)
            {
                string code = manager.GenerateEmailConfirmationToken(user.Id);
                string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, request);
                SendEmailConfirmation(user.Email, callbackUrl);

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
            }
            return result;
        }

        public void SendEmailConfirmation(string email, string callbackUrl)
        {

            SmtpClient client = new SmtpClient();
            MailMessage msg = new MailMessage
            {
                Subject = "[YOYOLOOP] Please confirm your email",
                Body = "Please confirm your email by clicking <a href=\"" + callbackUrl + "\">here</a>.",
                IsBodyHtml = true
            };

            msg.To.Add(email);
            msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);

            try
            {
                client.Send(msg);
            }
            finally
            {
                if (msg != null)
                {
                    msg.Dispose();
                }
            }
        }

    }
}
