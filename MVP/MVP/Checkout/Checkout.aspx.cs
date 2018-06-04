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
        private readonly CheckoutService service = new CheckoutService();

        CheckoutDTO pageData;

        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
        }

        private void InitData()
        {
            pageData = null;
            if (IsPostBack)
            {
                pageData = (CheckoutDTO)Session["checkout.data"];
            }

            if (pageData == null)
            {
                pageData = service.GetInitialData();
                Session["checkout.data"] = pageData;
            }
        }
    }
}