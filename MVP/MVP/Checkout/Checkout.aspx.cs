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
using Microsoft.AspNet.Identity;

namespace MVP.Checkout
{
    public partial class Checkout : System.Web.UI.Page
    {
        private readonly CheckoutService service = new CheckoutService();
        protected readonly string stripePublishableKey = WebConfigurationManager.AppSettings["StripePublishableKey"];

        protected CheckoutDTO pageData;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(User?.Identity.IsAuthenticated == false)
            {
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Page requires authenticated user\")</SCRIPT>"); // Needs pretty error message
                //Response.Redirect("/");
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
                if (!string.IsNullOrEmpty(hfStripeToken))
                {
                    string error;
                    if (service.ProcessPayment(pageData, hfStripeToken, out error))
                    {
                        Response.Redirect("/Confirm/Confirm?Id=" + pageData.BookingId.ToString());
                    }
                    else
                    {
                        //HANDLE ERROR
                        HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"" + error + "\")</SCRIPT>");
                    }
                }
            }

            if (pageData == null)
            {
                pageData = service.GetInitialData();
                ProcessQueryString();
                Session["checkout.data"] = pageData;
                UpdateCheckoutPanel();
                
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
                    // temp blank values to stop page from crashing - eventually not needed when redirect is uncommented
                    pageData = new CheckoutDTO
                    {
                        BookingId = Guid.Empty,
                        UserId = string.Empty,
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

                    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Invalid Booking.\")</SCRIPT>");
                    //Response.Redirect("/Calendar/Calendar");
                }
                else if (pageData.UserId != User?.Identity.GetUserId())
                {
                    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Wrong user.\")</SCRIPT>");
                    //Response.Redirect("/Calendar/Calendar");
                }
                else
                {
                    if(pageData.PromoValid)
                    {
                        pnPromocode.Visible = false;
                    }
                }
            }
            else
            {
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Invalid QueryString.\")</SCRIPT>");
                //Response.Redirect("/Calendar/Calendar");
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