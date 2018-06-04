using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MVP.Services;
using MVP.Models;
using MVP.Models.Entities;

namespace MVP.Checkout
{
    public partial class Checkout : System.Web.UI.Page
    {
        public class PageState
        {
            public Input Values { get; set; }

            public class Input
            {
                public string PayMethod { get; set; }
                public string CardName { get; set; }
                public string CardNumber { get; set; }
                public string CardDate { get; set; }
                public string CardCVV { get; set; }
            }
        }

        private readonly CheckoutService service = new CheckoutService();

        public CheckoutDTO pageData;
        public PageState localData;

        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
        }

        private void InitData()
        {
            pageData = null;
            localData = null;

            if (IsPostBack)
            {
                pageData = (CheckoutDTO)Session["checkout.data"];
                localData = (PageState)Session["local.data"];
            }

            if (pageData == null)
            {
                pageData = service.GetInitialData();
                Session["checkout.data"] = pageData;
            }

            if (localData == null)
            {
                localData = GetInitialData();
                ProcessQueryString();
                InitializeControls();
                Session["local.data"] = localData;
            }
        }

        private PageState GetInitialData()
        {
            var result = new PageState()
            {
                Values = new PageState.Input()
            };

            return result;
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

        private void InitializeControls()
        {

        }
    }
}