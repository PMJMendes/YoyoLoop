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
            RepTrips.DataSource = pageData.Trips;
            RepTrips.DataBind();
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
            }
        }

        protected void RepTrips_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.DataItem != null)
            {
                var trip = (TripDetail)e.Item.DataItem;
                var time = (Label)e.Item.FindControl("lbTime");
                var start = (Label)e.Item.FindControl("lbStart");
                var end = (Label)e.Item.FindControl("lbEnd");
                var driver = (DropDownList)e.Item.FindControl("ddlDriver");
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            service.UpdateTrips(pageData);
        }
    }
}
