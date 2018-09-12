using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using MVP.Services;

namespace MVP.Controls
{
    public partial class Register : UserControl, IPostBackEventHandler
    {
        private readonly MasterService service = new MasterService();

        public event EventHandler<EventArgs> SignIn;

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            string userid;
            IdentityResult result = service.CreateUser(Context.GetOwinContext(),
                    (code, id) => IdentityHelper.GetUserConfirmationRedirectUrl(code, id, Request),
                    TbRegisterEmail.Text, TbRegisterPassword.Text, TbRegisterName.Text, out userid);
            if (result.Succeeded)
            {
                GA_Signup(userid, TbRegisterEmail.Text, TbRegisterName.Text);
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

        void IPostBackEventHandler.RaisePostBackEvent(string e)
        {
            OnSignIn(e);
        }

        protected void GA_Signup(string id, string email, string name)
        {
            ScriptManager.RegisterStartupScript(upRegister, upRegister.GetType(), "GA-SignupKey", "GTM_Signup('" + id + "','" + email + "','" + name + "');", true);
        }
    }
}