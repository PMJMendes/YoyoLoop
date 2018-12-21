using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using MVP.Models.Helpers;
using MVP.Services;
using static MVP.SiteMaster;

namespace MVP.Controls
{
    public partial class Register : UserControl, IPostBackEventHandler
    {
        private readonly MasterService service = new MasterService();

        public event EventHandler<EventArgs> SignIn;
        public event EventHandler<ExternalLoginEventArgs> ExternalLogin;

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            string userid;
            IdentityResult result = service.CreateUser(Context.GetOwinContext(),
                    (code, id) => IdentityHelper.GetUserConfirmationRedirectUrl(code, id, Request),
                    TbRegisterEmail.Text, TbRegisterPassword.Text, TbRegisterName.Text, tbRegisterPhoneNumber.Text, out userid);
            if (result.Succeeded)
            {
                ApplicationHelpers.GTM_Signup(this, userid, TbRegisterEmail.Text, TbRegisterName.Text);
                ScriptManager.RegisterStartupScript(upRegister, upRegister.GetType(), "registerPostBackKey", "setTimeout(function(){$.blockUI();__doPostBack('" + UniqueID + "', '');},1);", true);
            }
            else
            {
                RegisterErrorMessage.Text = Resources.LocalizedText.Controls_Register_RegisterMessage_Failure;
            }
        }

        protected virtual void OnSignIn(string e)
        {
            SignIn?.Invoke(this, new EventArgs());
        }

        protected virtual void OnExternalLogin(ExternalLoginEventArgs args)
        {
            ExternalLogin?.Invoke(this, args);
        }

        void IPostBackEventHandler.RaisePostBackEvent(string e)
        {
            OnSignIn(e);
        }

        protected void btnLoginFacebook_ServerClick(object sender, EventArgs e)
        {
            OnExternalLogin(new ExternalLoginEventArgs
            {
                Provider = "Facebook"
            });
        }

        protected void btnLoginGoogle_ServerClick(object sender, EventArgs e)
        {
            OnExternalLogin(new ExternalLoginEventArgs
            {
                Provider = "Google"
            });
        }
    }
}