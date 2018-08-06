using Microsoft.AspNet.Identity;
using MVP.Models.Extensions;
using MVP.Models.Helpers;
using MVP.Services;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Profile
{
    public partial class Billing : System.Web.UI.Page
    {
        protected readonly string stripePublishableKey = WebConfigurationManager.AppSettings["StripePublishableKey"];
        private readonly ProfileService service = new ProfileService();
        protected ProfileDTO pageData;

        protected void Page_Init(object sender, EventArgs e)
        {
            // Load scripts
            ScriptManager mgr = ScriptManager.GetCurrent(this.Page);

            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("./Scripts/stripe-createCardToken.js") });
        }

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

                // StripeHandler
                NameValueCollection nvc = Request.Form;
                string hfStripeToken = nvc["hfStripeToken"];
                string hfStripeError = nvc["hfStripeError"];
                if (!string.IsNullOrEmpty(hfStripeToken))
                {
                    string error;
                    if (service.AddCard(pageData, hfStripeToken, out error))
                    {
                        ApplicationHelpers.ShowMessage(this, "O teu cartão foi adicionado com sucesso");
                        GetCardData();
                    }
                    else
                    {
                        //PAYMENT ERROR - need better error handling here
                        ApplicationHelpers.ShowMessage(this, error);
                    }
                }
                else if (!string.IsNullOrEmpty(hfStripeError))
                {
                    //SUBMIT ERROR - need better error handling here
                    ApplicationHelpers.ShowMessage(this, hfStripeError);
                }
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
            UpdateBillingSection();
            GetCardData();
            UpdatePaymentSection();
        }

        private void UpdateBillingSection()
        {
            txtBillingName.Text = pageData.BillingName;
            txtBillingCompany.Text = pageData.BillingCompany;
            txtBillingNIF.Text = pageData.BillingNIF;
            txtBillingAddress.Text = pageData.BillingAddress;
            txtBillingZIP.Text = pageData.BillingZIP;
            txtBillingCity.Text = pageData.BillingCity;
            upBillingDetails.Update();
        }

        private void GetCardData()
        {
            pageData = service.GetStripeCustomerData(pageData);
            ddlCardMenu.DataSource = pageData.StripeCardList;
            ddlCardMenu.DataBind();
            ddlCardMenu.Width = (pageData.StripeCardList.OrderByDescending(l => l.Text.Length).First().Text.Length) * 10;
            UpdatePaymentSection();
        }

        private void UpdatePaymentSection()
        {
            if (ddlCardMenu.SelectedValue == "new")
            {
                //STOP MAINCONTENT UPDATES from CHILD panels while StripeForm is up
                UpdatePanel masterpanel = Master.FindControl("upMainContent") as UpdatePanel;
                masterpanel.UpdateMode = UpdatePanelUpdateMode.Conditional;
                masterpanel.ChildrenAsTriggers = false;

                phCardEntry.Visible = true;
                phCardDisplay.Visible = false;
            }
            else
            {
                //RESUME MAINCONTENT UPDATES from CHILD panels while StripeForm is hidden
                UpdatePanel masterpanel = Master.FindControl("upMainContent") as UpdatePanel;
                masterpanel.UpdateMode = UpdatePanelUpdateMode.Always;
                masterpanel.ChildrenAsTriggers = true;

                phCardEntry.Visible = false;
                phCardDisplay.Visible = true;
                DisplayCard(ddlCardMenu.SelectedValue);
            }
            upPaymentMethods.Update();
        }

        protected void DisplayCard(string cardid)
        {
            Stripe.StripeCard card = service.GetCard(pageData, cardid);
            tbCardHolderName.Text = card.Name;
            tbCardNumber.Text = "Termina em " + card.Last4;
            tbCardExpiry.Text = card.ExpirationMonth.ToString("00") + "/" + card.ExpirationYear.ToString("00");
            if(cardid == pageData.StripedCustomerDefaultSourceId)
            {
                cbDefaultCard.Checked = true;
            }
            else
            {
                cbDefaultCard.Checked = false;
            }
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

        protected void ddlCardMenu_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdatePaymentSection();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect("/");
        }

        protected void btnUpdateCard_Click(object sender, EventArgs e)
        {
            string error;
            if (service.UpdateCard(pageData, ddlCardMenu.SelectedValue, tbCardHolderName.Text, tbCardExpiry.Text, cbDefaultCard.Checked, out error))
            {
                ApplicationHelpers.ShowMessage(this, "O cartão foi actualizado com sucesso");
                GetCardData();
            }
            else
            {
                //UPDATE ERROR - need better error handling here
                ApplicationHelpers.ShowMessage(this, error);
            }
        }

        protected void btnRemoveCard_Click(object sender, EventArgs e)
        {
            string error;
            if (service.RemoveCard(pageData, ddlCardMenu.SelectedValue, out error))
            {
                ApplicationHelpers.ShowMessage(this, "O cartão foi removido com sucesso");
                GetCardData();
            }
            else
            {
                //REMOVE ERROR - need better error handling here
                ApplicationHelpers.ShowMessage(this, error);
            }
        }
    }
}