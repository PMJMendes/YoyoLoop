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
                RepTrips.DataSource = pageData.Trips;
                RepTrips.DataBind();
            }
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
            }
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
            ApplicationHelpers.ShowMessage(this, changes.ToString() + " trips have been updated.");
        }
    }
}
