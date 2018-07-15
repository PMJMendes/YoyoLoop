using System;
using System.Linq;
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
            IdentityResult result = service.CreateUser(Context, Request, TbRegisterEmail.Text, TbRegisterPassword.Text, TbRegisterName.Text);
            if (result.Succeeded)
            {
                ScriptManager.RegisterStartupScript(upRegister, upRegister.GetType(), "registerPostBackKey", "setTimeout(function(){$.blockUI();__doPostBack('" + UniqueID + "', '');},1);", true);
            }
            else
            {
                RegisterErrorMessage.Text = result.Errors.FirstOrDefault();
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
    }
}