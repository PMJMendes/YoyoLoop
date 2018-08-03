using Microsoft.AspNet.Identity;
using MVP.Models.Helpers;
using MVP.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Profile
{
    public partial class Billing : System.Web.UI.Page
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
            txtBillingName.Text = pageData.BillingName;
            txtBillingCompany.Text = pageData.BillingCompany;
            txtBillingNIF.Text = pageData.BillingNIF;
            txtBillingAddress.Text = pageData.BillingAddress;
            txtBillingZIP.Text = pageData.BillingZIP;
            txtBillingCity.Text = pageData.BillingCity;
        }

        protected void btnBillingSave_Click(object sender, EventArgs e)
        {
            pageData.BillingName = txtBillingName.Text;
            pageData.BillingCompany = txtBillingCompany.Text;
            pageData.BillingNIF = txtBillingNIF.Text;
            pageData.BillingAddress = txtBillingAddress.Text;
            pageData.BillingZIP = txtBillingZIP.Text;
            pageData.BillingCity = txtBillingCity.Text;
            service.UpdateBillingDetails(pageData);
            ApplicationHelpers.ShowMessage(this, "Os teus dados foram actualizados com sucesso.");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect("/");
        }
    }
}