using MVP.Models.Extensions;
using MVP.Models.Helpers;
using MVP.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP
{
    public partial class _Default : Page
    {
        public class PageState
        {
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

            if(IsPostBack)
            {
                localData = (PageState)Session["homepage.data"];
            }

            if(localData == null)
            {
                localData = new PageState();
                if (User?.Identity.IsAuthenticated == false)
                {
                    localData.UserEmail = string.Empty;
                }
                else
                {
                    localData.UserEmail = User.Identity.GetUserEmail();
                }
                Session["homepage.data"] = localData;
                InitializeControls();
            }
        }

        private void InitializeControls()
        {
            UpdateSuggestModal();
        }

        private void UpdateSuggestModal()
        {
            tbSuggestEmail.Text = string.Empty;
            tbSuggestBody.Text = string.Empty;
            if (!string.IsNullOrEmpty(localData.UserEmail))
            {
                tbSuggestEmail.Enabled = false;
                tbSuggestEmail.Text = localData.UserEmail;
            }
        }

        protected void UserSignIn(object sender, EventArgs e)
        {
            if (User?.Identity.IsAuthenticated == true)
            {
                localData.UserEmail = User.Identity.GetUserEmail();
                UpdateSuggestModal();
            }
        }

        protected void btnSuggestSend_Click(object sender, EventArgs e)
        {
            masterService.SendSuggestion(tbSuggestEmail.Text, tbSuggestBody.Text);
            ApplicationHelpers.ShowMessage(this, Resources.LocalizedText.HomePage_SuggestLoop_SuggestSend_Message);
            UpdateSuggestModal();
        }
    }
}