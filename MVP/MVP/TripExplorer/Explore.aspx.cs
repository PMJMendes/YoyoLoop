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
            DdlEndRegion.DataBind();
            DdlStartAP.DataBind();

            CheckParams();
        }

        protected void DdlEndRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlEndAP.DataBind();

            CheckParams();
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

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            service.GetAvailableTripSlots(pageData);
            GvTripSlots.DataBind();
        }

        public IQueryable<ListItem> DdlStartRegion_GetData()
        {
            return new[] { new ListItem("-", Guid.Empty.ToString()) }.Concat(
                pageData.Routes.Select(r => r.StartRegion).Distinct().
                Select(lr => new ListItem(lr.Name, lr.LoopedRegionId.ToString()))
            ).AsQueryable();
        }

        public IQueryable<ListItem> DdlEndRegion_GetData()
        {
            return new[] { new ListItem("-", Guid.Empty.ToString()) }.Concat(
                GetPossibleRoutes().Select(r => r.EndRegion).Distinct().
                Select(lr => new ListItem(lr.Name, lr.LoopedRegionId.ToString()))
            ).AsQueryable();
        }

        public IQueryable<ListItem> DdlStartAP_GetData()
        {
            return new[] { new ListItem(Properties.Strings.AnyPlace, Guid.Empty.ToString()) }.Concat(
                GetPossibleSAPs()?.Select(ap => new ListItem(ap.Name, ap.AccessPointId.ToString())) ?? Enumerable.Empty<ListItem>()
            ).AsQueryable();
        }

        public IQueryable<ListItem> DdlEndAP_GetData()
        {
            return new[] { new ListItem(Properties.Strings.AnyPlace, Guid.Empty.ToString()) }.Concat(
                GetPossibleDAPs()?.Select(ap => new ListItem(ap.Name, ap.AccessPointId.ToString())) ?? Enumerable.Empty<ListItem>()
            ).AsQueryable();
        }

        public IQueryable<object> GvTripSlots_GetData()
        {
            var sourceAccessPoints = pageData.SelectedSAP == null ? GetPossibleSAPs() : new[] { pageData.SelectedSAP };
            var destinationAccessPoints = pageData.SelectedDAP == null ? GetPossibleDAPs() : new[] { pageData.SelectedDAP };

            return pageData.DepartureTimes.Where(dt => pageData.SelectedRoute != null).
                SelectMany(dt => sourceAccessPoints.SelectMany(sap => destinationAccessPoints.Select(dap => new
            {
                Departure = dt,
                SourceRegion = sap.Region.Name,
                SourceAccessPoint = sap.Name,
                DestinationRegion = dap.Region.Name,
                DestinationAccessPoint = dap.Name,
                Arrival = dt + pageData.SelectedRoute.Duration
            }))).AsQueryable();
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
