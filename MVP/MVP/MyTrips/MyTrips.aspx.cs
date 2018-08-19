using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MVP.Services;
using MVP.Models.Entities;
using Microsoft.AspNet.Identity;

namespace MVP.MyTrips
{
    public partial class MyTrips : System.Web.UI.Page
    {
        private readonly MyTripsService service = new MyTripsService();
        protected MyTripsDTO pageData;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (User?.Identity.IsAuthenticated == false)
            {
                Response.Redirect("/");
            }
            InitData();
            Initialize_Repeaters();
        }

        protected void RepActiveBookings_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var booking = (Booking)e.Item.DataItem;
            var control = (Ticket)e.Item.FindControl("Ticket");

            control.TicketBooking = booking;
        }

        protected void RepPastBookings_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var booking = (Booking)e.Item.DataItem;
            var control = (PastTicket)e.Item.FindControl("Ticket");

            control.TicketBooking = booking;
        }

        protected void Initialize_Repeaters()
        {
            if(pageData.ActiveBookings.Any())
            {
                RepActiveBookings.DataSource = pageData.ActiveBookings;
                RepActiveBookings.DataBind();
                RepActiveBookings.Visible = true;
            }
            else
            {
                RepActiveBookings.Visible = false;
            }

            if (pageData.PastBookings.Any())
            {
                RepPastBookings.DataSource = pageData.PastBookings;
                RepPastBookings.DataBind();
                RepPastBookings.Visible = true;
            }
            else
            {
                RepPastBookings.Visible = false;
            }
        }

        private void InitData()
        {
            pageData = null;

            if (IsPostBack)
            {
                pageData = (MyTripsDTO)Session["mytrips.data"];
            }

            if (pageData == null)
            {
                pageData = service.GetInitialData();
                Session["mytrips.data"] = pageData;
            }
        }
    }
}