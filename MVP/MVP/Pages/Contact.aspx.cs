using MVP.Models.Extensions;
using MVP.Models.Helpers;
using MVP.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Pages
{
    public partial class Contact : System.Web.UI.Page
    {
        public class PageState
        {
            public string UserContactName;
            public string UserEmail;
        }

        private readonly MasterService masterService = new MasterService();
        protected PageState localData;

        protected void Page_Init(object sender, EventArgs e)
        {
            Master.PassSignIn += new EventHandler<EventArgs>(UserSignIn);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            localData = null;

            if (IsPostBack)
            {
                localData = (PageState)Session["contact.data"];
            }

            if (localData == null)
            {
                localData = new PageState();
                if (User?.Identity.IsAuthenticated == false)
                {
                    localData.UserContactName = string.Empty;
                    localData.UserEmail = string.Empty;
                }
                else
                {
                    localData.UserContactName = User.Identity.GetUserContactName();
                    localData.UserEmail = User.Identity.GetUserEmail();
                }
                Session["contact.data"] = localData;
                InitializeControls();
            }
        }

        private void InitializeControls()
        {
            UpdateContactPanel();
        }

        private void UpdateContactPanel()
        {
            tbName.Text = string.Empty;
            tbEmail.Text = string.Empty;
            tbSubject.Text = string.Empty;
            tbBody.Text = string.Empty;
            if (!string.IsNullOrEmpty(localData.UserEmail))
            {
                tbName.Text = localData.UserContactName;
                tbEmail.Text = localData.UserEmail;
            }
            upContactForm.Update();
        }

        protected void UserSignIn(object sender, EventArgs e)
        {
            if (User?.Identity.IsAuthenticated == true)
            {
                localData.UserContactName = User.Identity.GetUserContactName();
                localData.UserEmail = User.Identity.GetUserEmail();
                UpdateContactPanel();
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            masterService.SendContactMessage(tbName.Text, tbEmail.Text, tbSubject.Text, tbBody.Text);
            ApplicationHelpers.ShowMessage(this, "A tua mensagem foi enviada");
            UpdateContactPanel();
        }
    }
}