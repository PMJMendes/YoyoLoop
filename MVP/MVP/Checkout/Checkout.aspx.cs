using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using MVP.Services;
using MVP.Models;
using MVP.Models.Entities;
using Stripe;

namespace MVP.Checkout
{
    public partial class Checkout : System.Web.UI.Page
    {

        private readonly CheckoutService service = new CheckoutService();

        public CheckoutDTO pageData;

        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
        }

        protected void ProcessPayment (string stripeToken)
        {
            var myCharge = new StripeChargeCreateOptions
            {
                Amount = (int)(pageData.Cost * 100),
                Currency = "EUR",
                Description = pageData.BookingId.ToString(),
                SourceTokenOrExistingSourceId = stripeToken
            };

            var chargeService = new StripeChargeService(WebConfigurationManager.AppSettings["StripeSecretKey"]);

            try
            {
                var stripeCharge = chargeService.Create(myCharge);
            }
            catch (StripeException ex)
            {
                StripeError stripeError = ex.StripeError;

                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"" + stripeError.ErrorType + "\")</SCRIPT>");
                // Handle error
                return;
            }

            // Successfully Authorised, do payment processing here...
            HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Sucessful charge.\")</SCRIPT>");
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
                if (!string.IsNullOrEmpty(hfStripeToken))
                {
                    ProcessPayment(hfStripeToken);
                }
            }

            if (pageData == null)
            {
                pageData = service.GetInitialData();
                ProcessQueryString();
                Session["checkout.data"] = pageData;
            }

        }

        private void ProcessQueryString()
        {
            var query = Request.QueryString;
            Guid id;
            
            if (Guid.TryParse(query["Id"], out id))
            {
                pageData = service.GetBooking(id);
                if(pageData == null)
                {
                    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Invalid Booking.\")</SCRIPT>");
                    //Response.Redirect("../Calendar/Calendar");
                }
            }
            else
            {
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Invalid QueryString.\")</SCRIPT>");
                //Response.Redirect("../Calendar/Calendar");
            }
        }
    }
}