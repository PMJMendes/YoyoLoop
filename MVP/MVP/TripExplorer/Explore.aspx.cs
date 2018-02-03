using MVP.Services;
using MVP.Models;
using MVP.Models.Entities;
using System;
using System.Linq;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace MVP.TripExplorer
{
    public partial class Explore : System.Web.UI.Page
    {
        private readonly ExploreService service = new ExploreService();

        ExploreDTO pageData;

        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
        }

        protected void DdlStartRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlStartRegion.SelectedValue != Guid.Empty.ToString())
            {
                DdlStartRegion.Items.Remove(DdlStartRegion.Items.FindByValue(Guid.Empty.ToString()));
            }

            DdlEndRegion.DataBind();
            DdlStartAP.DataBind();

            CheckParams();
        }

        protected void DdlEndRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlEndRegion.SelectedValue != Guid.Empty.ToString())
            {
                DdlEndRegion.Items.Remove(DdlEndRegion.Items.FindByValue(Guid.Empty.ToString()));
            }

            DdlEndAP.DataBind();

            CheckParams();
            DdlTime.DataBind(); //needs CheckParams to set the selected route

        }

        protected void DdlStartAP_SelectedIndexChanged(object sender, EventArgs e)
        {
            CheckParams();
        }

        protected void DdlEndAP_SelectedIndexChanged(object sender, EventArgs e)
        {
            CheckParams();
        }

        protected void CalDate_SelectionChanged(object sender, EventArgs e)
        {
            CheckParams();
        }

        protected void DdlTime_SelectedIndexChanged(object sender, EventArgs e)
        {
            CheckParams();
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            service.GetAvailableTripSlots(pageData);
            GvTripSlots.DataBind();
        }

        protected void GvTripSlots_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "Select")
            {
                //check login

                GridViewRow row = GvTripSlots.Rows[Convert.ToInt32(e.CommandArgument)];

                //Debug Label
                LbDeparture.Text = row.Cells[0].Text;
                LbSourceRegion.Text = row.Cells[1].Text;
                LbSourceAccessPoint.Text = row.Cells[2].Text;
                LbDestinationRegion.Text = row.Cells[3].Text;
                LbDestinationAccessPoint.Text = row.Cells[4].Text;
                LbArrival.Text = row.Cells[5].Text;

                /*Create Selected Trip
                Currently the GvTripSlots only has the name properties for each element;
                Thinking of adding hidden GUIDs for each element to the Gv, get them here and pass the necessary GUIDs
                to a CreateTrip service.
                */

                //Process Payment

                //Validate Selected Trip
            }
        }

        public IEnumerable<ListItem> DdlStartRegion_GetData()
        {
            return new[] { new ListItem("-", Guid.Empty.ToString()) }.Concat(
                pageData.Routes.Select(r => r.StartRegion).Distinct().
                Select(lr => new ListItem(lr.Name, lr.LoopedRegionId.ToString()))
            );
        }

        public IEnumerable<ListItem> DdlEndRegion_GetData()
        {
            return new[] { new ListItem("-", Guid.Empty.ToString()) }.Concat(
                GetPossibleRoutes().Select(r => r.EndRegion).Distinct().
                Select(lr => new ListItem(lr.Name, lr.LoopedRegionId.ToString()))
            );
        }

        public IEnumerable<ListItem> DdlStartAP_GetData()
        {
            return new[] { new ListItem(Properties.Strings.AnyPlace, Guid.Empty.ToString()) }.Concat(
                GetPossibleSAPs()?.Select(ap => new ListItem(ap.Name, ap.AccessPointId.ToString())) ?? Enumerable.Empty<ListItem>()
            );
        }

        public IEnumerable<ListItem> DdlEndAP_GetData()
        {
            return new[] { new ListItem(Properties.Strings.AnyPlace, Guid.Empty.ToString()) }.Concat(
                GetPossibleDAPs()?.Select(ap => new ListItem(ap.Name, ap.AccessPointId.ToString())) ?? Enumerable.Empty<ListItem>()
            );
        }

        public IEnumerable<String> DdlTime_GetData()
        {
            yield return Properties.Strings.AnyTime;

            var route = pageData.SelectedRoute;

            if (route == null)
            {
                yield break;
            }

            TimeSpan starttime = route.MinStartTime;
            TimeSpan endtime = route.MaxEndTime - route.Duration;
            TimeSpan interval = route.DepartureInterval;

            while (starttime <= endtime)
            {
                yield return starttime.ToString("hh\\:mm");

                starttime += interval;
            }
        }

        public IEnumerable<object> GvTripSlots_GetData()
        {
            var sourceAccessPoints = pageData.SelectedSAP == null ? GetPossibleSAPs() : new[] { pageData.SelectedSAP };
            var destinationAccessPoints = pageData.SelectedDAP == null ? GetPossibleDAPs() : new[] { pageData.SelectedDAP };

            return pageData.Departure.Where(dt => pageData.SelectedRoute != null).
                SelectMany(dt => sourceAccessPoints.SelectMany(sap => destinationAccessPoints.Select(dap => new
            {
                Departure = dt,
                SourceRegion = sap.Region.Name,
                SourceAccessPoint = sap.Name,
                DestinationRegion = dap.Region.Name,
                DestinationAccessPoint = dap.Name,
                Arrival = dt + pageData.SelectedRoute.Duration
            })));
        }

        private void InitData()
        {
            pageData = null;
            if (IsPostBack)
            {
                pageData = (ExploreDTO)Session["explore.data"];
            }
            else
            {
                DateTime dt = DateTime.Today.AddDays(1);
                CalDate.VisibleDate = dt;
                CalDate.SelectedDate = dt;
            }

            if (pageData == null)
            {
                pageData = service.GetInitialData();
                Session["explore.data"] = pageData;
            }
        }

        private void CheckParams()
        {
            pageData.SelectedRoute = GetPossibleRoutes().Where(r => r.EndRegion.LoopedRegionId.ToString() == DdlEndRegion.SelectedValue).FirstOrDefault();

            pageData.SelectedSAP = GetPossibleSAPs()?.Where(ap => ap.AccessPointId.ToString() == DdlStartAP.SelectedValue)?.FirstOrDefault();

            pageData.SelectedDAP = GetPossibleDAPs()?.Where(ap => ap.AccessPointId.ToString() == DdlEndAP.SelectedValue)?.FirstOrDefault();

            pageData.SelectedDate = CalDate.SelectedDate;

            if (DdlTime.SelectedIndex == 0)
            {
                pageData.SelectedTime = new TimeSpan(-1);
            }
            else
            {
                pageData.SelectedTime = TimeSpan.Parse(DdlTime.SelectedValue);
            }
        }

        private IEnumerable<Route> GetPossibleRoutes()
        {
            return pageData.Routes.Where(r => r.StartRegion.LoopedRegionId.ToString() == DdlStartRegion.SelectedValue);
        }

        private IEnumerable<AccessPoint> GetPossibleSAPs()
        {
            return GetPossibleRoutes().Select(r => r.StartRegion).Distinct().FirstOrDefault()?.AccessPoints;
        }

        private IEnumerable<AccessPoint> GetPossibleDAPs()
        {
            return GetPossibleRoutes().Where(r => r.EndRegion.LoopedRegionId.ToString() == DdlEndRegion.SelectedValue).FirstOrDefault()?.EndRegion?.AccessPoints;
        }
    }
}
