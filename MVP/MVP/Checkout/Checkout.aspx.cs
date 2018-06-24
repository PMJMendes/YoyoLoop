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
                        Seats = 0,
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
            }
            else
            {
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Invalid QueryString.\")</SCRIPT>");
                //Response.Redirect("/Calendar/Calendar");
            }
        }
    }
}