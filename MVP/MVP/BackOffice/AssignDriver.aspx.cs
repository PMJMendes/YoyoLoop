using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MVP.Services;
using MVP.Models;
using MVP.Models.Entities;
using MVP.Models.Extensions;
using MVP.Models.Helpers;

namespace MVP.BackOffice
{
    public partial class AssignDriver : System.Web.UI.Page
    {
        private readonly AssignDriverService service = new AssignDriverService();

        AssignDriverDTO pageData;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (User?.Identity.IsAdmin() == false)
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
                pageData = (AssignDriverDTO)Session["assigndriver.data"];
            }

            if (pageData == null)
            {
                pageData = service.GetInitialData();
                Session["assigndriver.data"] = pageData;
                InitializeRepeaters();
            }
        }

        private void InitializeRepeaters()
        {
            RepTrips.DataSource = pageData.Trips;
            RepTrips.DataBind();
        }

        protected void RepTrips_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.DataItem != null)
            {
                var trip = (TripDetail)e.Item.DataItem;
                var tripid = (Label)e.Item.FindControl("lbTripID");
                var time = (Label)e.Item.FindControl("lbTime");
                var start = (Label)e.Item.FindControl("lbStart");
                var end = (Label)e.Item.FindControl("lbEnd");
                var driver = (DropDownList)e.Item.FindControl("ddlDriver");
                var panel = (PlaceHolder)e.Item.FindControl("phBookings");
                var showbutton = (ImageButton)e.Item.FindControl("btnShowBookings");
                var hidebutton = (ImageButton)e.Item.FindControl("btnHideBookings");
                var bookings = (Repeater)e.Item.FindControl("RepBookings");
                tripid.Text = trip.TripID.ToString();
                time.Text = trip.StartTime.ToString();
                start.Text = trip.StartRegion + " (" + trip.StartAP + ")";
                end.Text = trip.EndRegion + " (" + trip.EndAP + ")";
                var driverlist = pageData.Drivers;
                if (string.IsNullOrEmpty(trip.Driver.Value) && !driverlist.Any(d => d.Value == string.Empty))
                {
                    driverlist.Add(new ListItem(string.Empty, string.Empty));
                }
                driver.DataSource = driverlist.OrderBy(d => d.Text);
                driver.DataBind();
                driver.SelectedValue = trip.Driver.Value;
                panel.Visible = false;
                showbutton.Visible = true;
                hidebutton.Visible = false;
                bookings.DataSource = trip.Bookings;
                bookings.DataBind();
            }
        }

        protected void RepTrips_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList driver = e.Item.FindControl("ddlDriver") as DropDownList;
                if(driver != null)
                {
                    driver.SelectedIndexChanged += ddlDriver_SelectedIndexChanged;
                }
                ImageButton showbutton = e.Item.FindControl("btnShowBookings") as ImageButton;
                if(showbutton != null)
                {
                    showbutton.Click += btnShowBookings_Click;
                }
                ImageButton hidebutton = e.Item.FindControl("btnHideBookings") as ImageButton;
                if (hidebutton != null)
                {
                    hidebutton.Click += btnHideBookings_Click;
                }
            }
        }

        protected void RepBookings_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var booking = (BookingDetail)e.Item.DataItem;
            var user = (Label)e.Item.FindControl("lbUser");
            var seats = (Label)e.Item.FindControl("lbSeats");
            var cost = (Label)e.Item.FindControl("lbCost");
            if(user != null) user.Text = booking.User;
            if(seats != null) seats.Text = booking.Seats;
            if(cost != null) cost.Text = booking.Cost;
        }

        protected void btnShowBookings_Click(object sender, ImageClickEventArgs e)
        {
            var showbutton = (ImageButton)sender;
            var repeater = (RepeaterItem)showbutton.Parent;
            var panel = (PlaceHolder)repeater.FindControl("phBookings");
            var hidebutton = (ImageButton)repeater.FindControl("btnHideBookings");
            var vis = panel.Visible;
            panel.Visible = true;
            showbutton.Visible = false;
            hidebutton.Visible = true;
        }

        protected void btnHideBookings_Click(object sender, ImageClickEventArgs e)
        {
            var hidebutton = (ImageButton)sender;
            var repeater = (RepeaterItem)hidebutton.Parent;
            var panel = (PlaceHolder)repeater.FindControl("phBookings");
            var showbutton = (ImageButton)repeater.FindControl("btnShowBookings");
            panel.Visible = false;
            showbutton.Visible = true;
            hidebutton.Visible = false;
        }

        protected void ddlDriver_SelectedIndexChanged(object sender, EventArgs e)
        {
            var driver = (DropDownList)sender;
            var repeater = (RepeaterItem)driver.Parent;
            var tripid = (Label)repeater.FindControl("lbTripID");
            int tripindex = pageData.Trips.FindIndex(t => t.TripID.ToString() == tripid.Text);
            pageData.Trips[tripindex].Driver = driver.SelectedItem;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int changes = service.UpdateTrips(pageData);
            InitializeRepeaters();
            ApplicationHelpers.ShowMessage(this, changes.ToString() + " trips have been updated.");
        }
    }
}
