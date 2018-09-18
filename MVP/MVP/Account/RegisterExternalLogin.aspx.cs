using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using MVP.Models;
using System;
using System.Linq;
using System.Security.Claims;
using System.Web;

namespace MVP.Account
{
    public partial class RegisterExternalLogin : System.Web.UI.Page
    {
        protected string ProviderName
        {
            get { return (string)ViewState["ProviderName"] ?? String.Empty; }
            private set { ViewState["ProviderName"] = value; }
        }
        protected string ProviderAccountKey
        {
            get { return (string)ViewState["ProviderAccountKey"] ?? String.Empty; }
            private set { ViewState["ProviderAccountKey"] = value; }
        }
        private void RedirectOnFail(string error, string url)
        {
            error += "<br><br>Tenta outra vez e se o erro persistir, contacta-nos.";
            Session["master.error"] = error;
            if(string.IsNullOrEmpty(url))
            {
                url = "/";
            }
            Response.Redirect(url);
        }
        protected void Page_Load()
        {
            // Process the result from an auth provider in the request
            ProviderName = IdentityHelper.GetProviderNameFromRequest(Request);
            string returnUrl = Request.QueryString["ReturnUrl"];
            if (String.IsNullOrEmpty(ProviderName))
            {
                string error = "Não foi possível contactar o serviço de autenticação externo.";
                RedirectOnFail(error, returnUrl);
                return;
            }
            if (!IsPostBack)
            {
                var owinContext = Context.GetOwinContext();
                var loginInfo = owinContext.Authentication.GetExternalLoginInfo();
                if (loginInfo == null)
                {
                    string error = "Ocorreu um erro ao autenticar com o" + " " + ProviderName + ".";
                    RedirectOnFail(error, returnUrl);
                    return;
                }
                var manager = owinContext.GetUserManager<ApplicationUserManager>();
                var signInManager = owinContext.Get<ApplicationSignInManager>();
                var user = manager.Find(loginInfo.Login);
                if (user != null)
                {
                    signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                    (this.Master as SiteMaster).UserSignIn(this, new EventArgs());
                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                }
                else if (User.Identity.IsAuthenticated)
                {
                    // Apply Xsrf check when linking
                    var verifiedloginInfo = owinContext.Authentication.GetExternalLoginInfo(IdentityHelper.XsrfKey, User.Identity.GetUserId());
                    if (verifiedloginInfo == null)
                    {
                        string error = "Ocorreu um erro ao autenticar com o" + " " + ProviderName + ".";
                        RedirectOnFail(error, returnUrl);
                        return;
                    }
                    var result = manager.AddLogin(User.Identity.GetUserId(), verifiedloginInfo.Login);
                    if (result.Succeeded)
                    {
                        IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                    }
                    else
                    {
                        string error = "Ocorreu um erro ao autenticar com o" + " " + ProviderName + ".";
                        RedirectOnFail(error, returnUrl);
                        return;
                    }
                }
                else
                {
                    string name = loginInfo.ExternalIdentity.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Name)?.Value.ToString();
                    string email = loginInfo.Email;
                    if(string.IsNullOrEmpty(email))
                    {
                        string error = "Ocorreu um erro ao autenticar com o" + " " + ProviderName + ".";
                        RedirectOnFail(error, returnUrl);
                        return;
                    }
                    CreateAndLoginUser(owinContext, email, name, returnUrl);
                }
            }
        }

        // This should be in services along with some stuff up above. The whole service flow / page decoupling needs to be refactored.
        // At this point in time, its just easier to do error handling from the controller.
        private void CreateAndLoginUser(IOwinContext context, string email, string name, string returnUrl)
        {
            var manager = context.GetUserManager<ApplicationUserManager>();
            var signInManager = context.GetUserManager<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = email, Email = email, ContactName = name, EmailConfirmed = true };
            IdentityResult result = manager.Create(user);
            if (result.Succeeded)
            {
                var loginInfo = context.Authentication.GetExternalLoginInfo();
                if (loginInfo == null)
                {
                    string error = "Ocorreu um erro ao autenticar com o" + " " + ProviderName + ".";
                    RedirectOnFail(error, returnUrl);
                    return;
                }
                (this.Master as SiteMaster).GA_Signup(user.Id, user.Email, user.ContactName);
                result = manager.AddLogin(user.Id, loginInfo.Login);
                if (result.Succeeded)
                {
                    signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                    IdentityHelper.RedirectToReturnUrl(returnUrl, Response);
                    return;
                }
                else
                {
                    string error = "Ocorreu um erro ao autenticar com o" + " " + ProviderName + ".";
                    RedirectOnFail(error, returnUrl);
                    return;
                }
            }
        }
    }
}