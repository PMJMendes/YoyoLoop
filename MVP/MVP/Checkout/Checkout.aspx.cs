using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using MVP.Services;
using MVP.Controls;
using MVP.Models;
using MVP.Models.Entities;
using MVP.Models.Extensions;
using Microsoft.AspNet.Identity;
using MVP.Models.Helpers;
using System.Web.Services;

namespace MVP.Checkout
{
    public partial class Checkout : System.Web.UI.Page
    {
        private readonly CheckoutService service = new CheckoutService();
        protected readonly string stripePublishableKey = WebConfigurationManager.AppSettings["StripePublishableKey"];

        protected CheckoutDTO pageData;

        protected void Page_Init(object sender, EventArgs e)
        {
            // Load scripts
            ScriptManager mgr = ScriptManager.GetCurrent(this.Page);

            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("./Scripts/stripe-createToken.js") });
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(User?.Identity.IsAuthenticated == false)
            {
                Response.Redirect("/");
            }

            InitData();
        }

        private void UpdateCheckoutPanel()
        {
            CheckoutPanel.Databind(service.GetCheckoutPanelData(pageData));
            upCheckoutPanel.Update();
        }

        private void InitData()
        {
            pageData = null;

            if (IsPostBack)
            {
                pageData = (CheckoutDTO)Session["checkout.data"];

                // StripeHandler
                NameValueCollection nvc = Request.Form;
                string hfStripeToken = nvc["hfStripeToken"];
                string hfStripeError = nvc["hfStripeError"];
                if (!string.IsNullOrEmpty(hfStripeToken))
                {
                    if(ddlCardMenu.SelectedValue == "new")
                    {
                        GetInvoiceData();
                        if (!cbSaveCard.Checked)
                        {
                            string error;
                            if (service.ProcessPayment(pageData, hfStripeToken, out error))
                            {
                                GA_Purchase();
                                //redirects changed to client side so GTM can fire
                                RedirectToConfirm();
                            }
                            else
                            {
                                ApplicationHelpers.ShowMessage(this, error);
                            }
                        }
                        else
                        {
                            string error;
                            if (service.AddCard(pageData, hfStripeToken, out error))
                            {
                                GA_Purchase();
                                //redirects changed to client side so GTM can fire
                                RedirectToConfirm();
                            }
                            else
                            {
                                ApplicationHelpers.ShowMessage(this, error);
                            }
                        }
                    }
                }
                else if (!string.IsNullOrEmpty(hfStripeError))
                {
                    string error = service.StripeErrorHandler(hfStripeError);
                    if(string.IsNullOrEmpty(error))
                    {
                        error = Resources.LocalizedText.Stripe_ErrorHandling_PaymentMethodValidation_Generic;
                    }
                    ApplicationHelpers.ShowMessage(this, error);
                }
            }

            if (pageData == null)
            {
                pageData = service.GetInitialData(User?.Identity.GetUserId());
                InitializeControls();
                ProcessQueryString();
                Session["checkout.data"] = pageData;
                UpdateCheckoutPanel();
            }
        }

        private void InitializeControls()
        {
            UpdateBillingSection();
            GetCardData();
        }

        private void UpdateBillingSection()
        {
            txtInvoiceName.Text = pageData.BillingName;
            txtInvoiceCompany.Text = pageData.BillingCompany;
            txtInvoiceNIF.Text = pageData.BillingNIF;
            txtInvoiceAddress.Text = pageData.BillingAdress;
            txtInvoiceZIP.Text = pageData.BillingZIP;
            txtInvoiceCity.Text = pageData.BillingCity;
            upBillingForm.Update();
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
                phPayNew.Visible = true;
                phCardDisplay.Visible = false;
                phPay.Visible = false;
            }
            else
            {
                //RESUME MAINCONTENT UPDATES from CHILD panels while StripeForm is hidden
                UpdatePanel masterpanel = Master.FindControl("upMainContent") as UpdatePanel;
                masterpanel.UpdateMode = UpdatePanelUpdateMode.Always;
                masterpanel.ChildrenAsTriggers = true;

                phCardEntry.Visible = false;
                phPayNew.Visible = false;
                phCardDisplay.Visible = true;
                phPay.Visible = true;
                DisplayCard(ddlCardMenu.SelectedValue);
            }
            upCheckoutPaymentForm.Update();
            upCheckoutPayButton.Update();
        }

        private void GetCardData()
        {
            pageData = service.GetStripeCustomerData(pageData);
            ddlCardMenu.DataSource = pageData.StripeCardList;
            ddlCardMenu.DataBind();
            ddlCardMenu.Width = (pageData.StripeCardList.OrderByDescending(l => l.Text.Length).First().Text.Length) * 10;
            UpdatePaymentSection();
        }

        private void GetInvoiceData()
        {
            pageData.Invoice = new CheckoutDTO.InvoiceData
            {
                Name = txtInvoiceName.Text,
                Company = txtInvoiceCompany.Text,
                NIF = txtInvoiceNIF.Text,
                Address = txtInvoiceAddress.Text,
                ZIP = txtInvoiceZIP.Text,
                City = txtInvoiceCity.Text
            };
            if (cbSaveDetails.Checked)
            {
                service.SaveBillingDetails(pageData);
            }
        }

        protected void DisplayCard(string cardid)
        {
            Stripe.StripeCard card = service.GetCard(pageData, cardid);
            tbCardHolderName.Text = card.Name;
            tbCardNumber.Text = Resources.LocalizedText.General_StripeCard_Card_CardNumber_EndsIn + " " + card.Last4;
            tbCardExpiry.Text = card.ExpirationMonth.ToString("00") + "/" + card.ExpirationYear.ToString("00");
        }

        private void ProcessQueryString()
        {
            var query = Request.QueryString;
            Guid id;
            
            if (Guid.TryParse(query["Id"], out id))
            {
                if (!string.IsNullOrEmpty(query["Code"]))
                {
                    pageData.Code = query["Code"];
                }
                pageData = service.GetBooking(id, pageData);
                if(pageData == null)
                {
                    // temp blank values to stop page from crashing during debugging
                    pageData = new CheckoutDTO
                    {
                        BookingId = Guid.Empty,
                        UserId = string.Empty,
                        BookingStatus = BookingStatus.CANCELLED,
                        Seats = 0,
                        FareType = Fare.FareType.STANDARD,
                        StandardPrice = 0,
                        Price = 0,
                        Promocode = string.Empty,
                        PromoValid = false,
                        Cost = 0,
                        StartTime = new DateTime(),
                        StartRegionName = "Região de Origem",
                        StartAPName = "Paragem de Origem",
                        EndRegionName = "Região de Destino",
                        EndAPName = "Paragem de Destino"
                    };

                    Response.Redirect("/");
                }
                else if (pageData.UserId != User?.Identity.GetUserId())
                {
                    Response.Redirect("/");
                }
                else
                {
                    if(pageData.PromoValid || pageData.MGM)
                    {
                        pnPromocode.Visible = false;
                    }
                }

                switch (pageData.BookingStatus)
                {
                    case (BookingStatus.CANCELLED):
                        phError.Visible = true;
                        phCheckout.Visible = false;
                        string url = "/Calendar/Calendar?";
                        url += "ori=" + pageData.StartRegionName;
                        url += "&dest=" + pageData.EndRegionName;
                        url += "&sap=" + pageData.StartAPName;
                        url += "&dap=" + pageData.EndAPName;
                        lkErrorRedirect.Attributes.Add("href", url);
                        break;
                    case (BookingStatus.BOOKED):
                        Response.Redirect("/Confirm/Confirm?Id=" + pageData.BookingId.ToString());
                        break;
                    case (BookingStatus.COMPLETED):
                        Response.Redirect("/Confirm/Confirm?Id=" + pageData.BookingId.ToString());
                        break;
                    case (BookingStatus.PENDING):
                        break;
                    default:
                        Response.Redirect("/");
                        break;
                }
            }
            else
            {
                Response.Redirect("/");
            }
        }

        protected void tbPromo_TextChanged(object sender, EventArgs e)
        {
            pageData.Promocode = tbPromo.Text.ToUpper();
            pageData = service.CheckPromo(pageData);
            UpdateCheckoutPanel();
            if (pageData.Promocode == string.Empty && pageData.Code == string.Empty)
            {
                phPromoCheck.Visible = false;
                phPromoError.Visible = false;
                tbPromo.Attributes.Add("placeholder", Resources.LocalizedText.Checkout_Promocode_tbPromo_placeholder);
                tbPromo.Enabled = true;
            }
            else
            {
                if (!pageData.PromoValid && !pageData.MGM)
                {
                    phPromoCheck.Visible = false;
                    phPromoError.Visible = true;
                    tbPromo.Text = string.Empty;
                    tbPromo.Attributes.Add("placeholder", string.Empty);
                    tbPromo.Enabled = false;
                }
                else
                {
                    phPromoCheck.Visible = true;
                    phPromoError.Visible = false;
                    tbPromo.Text = string.Empty;
                    tbPromo.Attributes.Add("placeholder", string.Empty);
                    tbPromo.Enabled = false;
                }
            }
        }

        protected void ddlCardMenu_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdatePaymentSection();
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            GetInvoiceData();
            string error;
            if (service.ProcessPayment(pageData, ddlCardMenu.SelectedValue, out error))
            {
                GA_Purchase();
                //redirects changed to client side so GTM can fire
                RedirectToConfirm();
            }
            else
            {
                ApplicationHelpers.ShowMessage(this, error);
            }
        }

        protected void ClearPromo_Click(object sender, ImageClickEventArgs e)
        {
            tbPromo.Text = string.Empty;
            tbPromo_TextChanged(tbPromo, new EventArgs());
        }

        protected void GA_Purchase()
        {
            string id = pageData.BookingId.ToString();
            string promocode = pageData.Promocode;
            string fare = pageData.FareType.ToString();
            string mgm = (pageData.MGM || pageData.UserMGM).ToString();
            string cost = pageData.Cost.ToString();
            string tax = (pageData.Cost * (decimal)0.06).ToString();
            string route = pageData.StartRegionName + "-" + pageData.EndRegionName;
            string type = "IDA";
            string date = pageData.StartTime.ToString("F", ApplicationHelpers.DefaultCulture());
            string seats = pageData.Seats.ToString();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "GA-TransactionKey", "GTM_Transaction('" + id + "','" + promocode + "','" + fare + "','" + mgm + "','" + cost + "','" + tax + "','" + route + "','" + type + "','" + date + "','" + seats + "');", true);
        }

        protected void RedirectToConfirm()
        {
            ApplicationHelpers.ClientRedirect(this, "/Confirm/Confirm?Id=" + pageData.BookingId.ToString());
        }
    }
}