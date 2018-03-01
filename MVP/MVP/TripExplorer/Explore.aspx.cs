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

        protected void DdlEndRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlEndRegion.SelectedValue != Guid.Empty.ToString())
            {
                DdlEndRegion.Items.Remove(DdlEndRegion.Items.FindByValue(Guid.Empty.ToString()));
            }

            DdlStartRegion.DataBind();
            DdlEndAP.DataBind();

            CheckParams();
        }

        protected void DdlStartRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlStartRegion.SelectedValue != Guid.Empty.ToString())
            {
                DdlStartRegion.Items.Remove(DdlStartRegion.Items.FindByValue(Guid.Empty.ToString()));
            }

            DdlStartAP.DataBind();

            CheckParams();
            DdlTime.DataBind(); //needs CheckParams to set the selected route
        }

        protected void DdlEndAP_SelectedIndexChanged(object sender, EventArgs e)
        {
            CheckParams();
        }

        protected void DdlStartAP_SelectedIndexChanged(object sender, EventArgs e)
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

                //Create Selected Trip
                
                //Process Payment

                //Validate Selected Trip
            }
        }

        public IEnumerable<ListItem> DdlEndRegion_GetData()
        {
            if (pageData.Routes.Where(r => r.EndRegion.Name == Request.QueryString["Dest"]).Count() != 0)
            {
                return pageData.Routes.Select(r => r.EndRegion).Distinct().Select(lr => new ListItem(lr.Name, lr.LoopedRegionId.ToString()));
            }
            else
            {
                return new[] { new ListItem("-", Guid.Empty.ToString()) }.Concat(
                    pageData.Routes.Select(r => r.EndRegion).Distinct().
                    Select(lr => new ListItem(lr.Name, lr.LoopedRegionId.ToString()))
                );
            }
        }

        public IEnumerable<ListItem> DdlStartRegion_GetData()
        {
            return new[] { new ListItem("-", Guid.Empty.ToString()) }.Concat(
                GetPossibleRoutes().Select(r => r.StartRegion).Distinct().
                Select(lr => new ListItem(lr.Name, lr.LoopedRegionId.ToString()))
            );
        }

        public IEnumerable<ListItem> DdlEndAP_GetData()
        {
            return new[] { new ListItem(Properties.Strings.AnyPlace, Guid.Empty.ToString()) }.Concat(
                GetPossibleDAPs()?.Select(ap => new ListItem(ap.Name, ap.AccessPointId.ToString())) ?? Enumerable.Empty<ListItem>()
            );
        }

        public IEnumerable<ListItem> DdlStartAP_GetData()
        {
            return new[] { new ListItem(Properties.Strings.AnyPlace, Guid.Empty.ToString()) }.Concat(
                GetPossibleSAPs()?.Select(ap => new ListItem(ap.Name, ap.AccessPointId.ToString())) ?? Enumerable.Empty<ListItem>()
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

            foreach (Route.Departure d in route.Departures)
            {
                yield return d.Time.ToString("hh\\:mm");
            }

            /*
            TimeSpan starttime = route.MinStartTime;
            TimeSpan endtime = route.MaxEndTime - route.Duration;
            TimeSpan interval = route.DepartureInterval;

            while (starttime <= endtime)
            {
                yield return starttime.ToString("hh\\:mm");

                starttime += interval;
            }
            */
        }

        public IEnumerable<object> GvTripSlots_GetData()
        {
            /* AvailableTripSlots - needs to be moved to the GetAvailableTripSlots service but currently depends on page methods
             (GetPossibleSAPs/DAPs) that depend on pagecontrols selected values */
            var sourceAccessPoints = pageData.SelectedSAP == null ? GetPossibleSAPs() : new[] { pageData.SelectedSAP };
            var destinationAccessPoints = pageData.SelectedDAP == null ? GetPossibleDAPs() : new[] { pageData.SelectedDAP };

            pageData.AvailableTripSlots = pageData.Departure.Where(dt => pageData.SelectedRoute != null).
                SelectMany(dt => sourceAccessPoints.SelectMany(sap => destinationAccessPoints.Select(dap => new TripSlot
            (
                dt,
                sap.Region,
                dap.Region,
                sap,
                dap,
                dt + pageData.SelectedRoute.Duration
            ))));
            /* AvailableTripSlots */

            return pageData.AvailableTripSlots.Select(ts => new
            {
                ts.Departure,
                SourceRegion = ts.SourceRegion.Name,
                SourceAccessPoint = ts.SourceAccessPoint.Name,
                DestinationRegion = ts.DestinationRegion.Name,
                DestinationAccessPoint = ts.DestinationAccessPoint.Name,
                ts.Arrival
            });
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
                
                //check query string
                string dest = Request.QueryString["Dest"];

                if (dest != null && dest != string.Empty)
                {
                    if (pageData.Routes.Where(r => r.EndRegion.Name == dest).Count() != 0)
                    {
                        DdlEndRegion.SelectedValue = pageData.Routes.Where(r => r.EndRegion.Name == dest).Select(er => er.EndRegion).FirstOrDefault().LoopedRegionId.ToString();
                    }
                }
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
            return pageData.Routes.Where(r => r.EndRegion.LoopedRegionId.ToString() == DdlEndRegion.SelectedValue);
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
