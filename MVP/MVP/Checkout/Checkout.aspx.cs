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
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Page requires authenticated user\")</SCRIPT>"); // Needs pretty error message
                //Response.Redirect("/");
            }

            //STOP MAINCONTENT UPDATES from CHILD panels
            UpdatePanel masterpanel = Master.FindControl("upMainContent") as UpdatePanel;
            masterpanel.UpdateMode = UpdatePanelUpdateMode.Conditional;
            masterpanel.ChildrenAsTriggers = false;

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
                    pageData.Invoice = new CheckoutDTO.InvoiceData
                    {
                        Name = txtInvoiceName.Text,
                        Company = txtInvoiceCompany.Text,
                        NIF = txtInvoiceNIF.Text,
                        Address = txtInvoiceAddress.Text,
                        ZIP = txtInvoiceZIP.Text,
                        City = txtInvoiceCity.Text
                    };

                    string error;
                    if (service.ProcessPayment(pageData, hfStripeToken, out error))
                    {   if(cbSaveDetails.Checked)
                        {
                            service.SaveBillingDetails(pageData);
                        }
                        Response.Redirect("/Confirm/Confirm?Id=" + pageData.BookingId.ToString());
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
                InitializeControls();
                ProcessQueryString();
                Session["checkout.data"] = pageData;
                UpdateCheckoutPanel();
            }
        }

        private void InitializeControls()
        {
            txtInvoiceName.Text = pageData.BillingName;
            txtInvoiceCompany.Text = pageData.BillingCompany;
            txtInvoiceNIF.Text = pageData.BillingNIF;
            txtInvoiceAddress.Text = pageData.BillingAdress;
            txtInvoiceZIP.Text = pageData.BillingZIP;
            txtInvoiceCity.Text = pageData.BillingCity;
        }

        private void ProcessQueryString()
        {
            var query = Request.QueryString;
            Guid id;
            
            if (Guid.TryParse(query["Id"], out id))
            {
                pageData = service.GetBooking(id, pageData);
                if(pageData == null)
                {
                    // temp blank values to stop page from crashing - eventually not needed when redirect is uncommented
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

                    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Couldn't find booking.\")</SCRIPT>");
                    //Response.Redirect("/Calendar/Calendar"); - ERROR PAGE WITH FOLLOWUP REDIRECT
                }
                else if (pageData.UserId != User?.Identity.GetUserId())
                {
                    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Wrong user for this booking.\")</SCRIPT>");
                    //Response.Redirect("/Calendar/Calendar"); - ERROR PAGE WITH FOLLOWUP REDIRECT
                }
                else
                {
                    if(pageData.PromoValid)
                    {
                        pnPromocode.Visible = false;
                    }
                }

                switch (pageData.BookingStatus)
                {
                    case (BookingStatus.CANCELLED):
                        HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"This booking has expired.\")</SCRIPT>");
                        //Response.Redirect("/Calendar/Calendar"); - ERROR PAGE WITH FOLLOWUP REDIRECT
                        break;
                    case (BookingStatus.BOOKED):
                        HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"This booking has already been payed.\")</SCRIPT>");
                        Response.Redirect("/Confirm/Confirm?Id=" + pageData.BookingId.ToString());
                        break;
                    case (BookingStatus.COMPLETED):
                        HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"This trip has already been completed.\")</SCRIPT>");
                        //Response.Redirect("/Calendar/Calendar"); - ERROR PAGE WITH FOLLOWUP REDIRECT
                        break;
                    case (BookingStatus.PENDING):
                        break;
                    default:
                        HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Something went wrong.\")</SCRIPT>");
                        //Response.Redirect("/Calendar/Calendar"); - GENERIC ERROR PAGE
                        break;
                }
            }
            else
            {
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Invalid QueryString.\")</SCRIPT>");
                //Response.Redirect("/Calendar/Calendar"); - ERROR PAGE WITH FOLLOWUP REDIRECT
            }
        }

        protected void tbPromo_TextChanged(object sender, EventArgs e)
        {
            pageData.Promocode = tbPromo.Text;
            pageData = service.CheckPromo(pageData);
            UpdateCheckoutPanel();
            if (pageData.Promocode == string.Empty)
            {
                pnPromoCheck.Visible = false;
                pnPromoError.Visible = false;
            }
            else
            {
                if (!pageData.PromoValid)
                {
                    pnPromoCheck.Visible = false;
                    pnPromoError.Visible = true;
                }
                else
                {
                    pnPromoCheck.Visible = true;
                    pnPromoError.Visible = false;
                }
            }
        }
    }
}