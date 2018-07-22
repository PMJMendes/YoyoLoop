using System;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using MVP.Models;

namespace MVP.Services
{
    public class MasterService
    {
        public SignInStatus LogIn (IOwinContext context, string email, string password, bool rememberme)
        {
            var manager = context.GetUserManager<ApplicationUserManager>();
            var signinManager = context.GetUserManager<ApplicationSignInManager>();

            // This doen't count login failures towards account lockout
            // To enable password failures to trigger lockout, change to shouldLockout: true
            var result = signinManager.PasswordSignIn(email, password, rememberme, shouldLockout: false);

            return result;
        }

        public void ForceLogIn(IOwinContext context, string userid)
        {
            var manager = context.GetUserManager<ApplicationUserManager>();
            var signinManager = context.GetUserManager<ApplicationSignInManager>();
            var user = manager.FindById(userid);

            signinManager.SignIn(user, false, false);
        }

        public IdentityResult CreateUser (IOwinContext context, Func<string, string, string> genCallbackUrl, string email, string password, string contactname)
        {
            var manager = context.GetUserManager<ApplicationUserManager>();
            var signInManager = context.Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = email, Email = email, ContactName = contactname };
            IdentityResult result = manager.Create(user, password);
            if (result.Succeeded)
            {
                string code = manager.GenerateEmailConfirmationToken(user.Id);
                string callbackUrl = genCallbackUrl(code, user.Id);
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

        public void SendResetPassword(string email, string callbackUrl)
        {
            SmtpClient client = new SmtpClient();
            MailMessage msg = new MailMessage
            {
                Subject = "[YOYOLOOP] Password reset confirmation",
                Body = "Please reset your password by clicking <a href=\"" + callbackUrl + "\">here</a>.",
                IsBodyHtml = true
            };

            msg.To.Add("no-reply@yoyoloop.com");
            msg.Bcc.Add(email);
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
