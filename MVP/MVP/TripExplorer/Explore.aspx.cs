using MVP.Services;
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
            CheckRoute();
        }

        protected void DdlEndRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            CheckRoute();
        }

        protected void DdlDate_SelectionChanged(object sender, EventArgs e)
        {
            CheckRoute();
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
                pageData.Routes.Where(r => r.StartRegion.LoopedRegionId.ToString() == DdlStartRegion.SelectedValue).
                Select(r => new ListItem(r.EndRegion.Name, r.RouteId.ToString()))
            ).AsQueryable();
        }

        public IQueryable<object> GvTripSlots_GetData()
        {
            return pageData.DepartureTimes.Where(dt => pageData.SelectedRoute != null).SelectMany(dt => pageData.SourceAccessPoints.SelectMany(sap => pageData.DestinationAccessPoints.Select(dap => new
            {
                DepartureTime = dt,
                ArrivalTime = dt + pageData.SelectedRoute.Duration,
                SourceAccessPoint = sap.Name,
                DestinationAccessPoint = dap.Name
            }))).AsQueryable();
        }

        private void InitData()
        {
            pageData = null;
            if (IsPostBack)
            {
                pageData = (ExploreDTO)Session["explore.data"];
            }

            if (pageData == null)
            {
                pageData = service.GetInitialData();
                Session["explore.data"] = pageData;
            }
        }

        private void CheckRoute()
        {
            pageData.SelectedRoute = pageData.Routes.Where(r => r.RouteId.ToString() == DdlEndRegion.SelectedValue).FirstOrDefault();
            pageData.SelectedDate = DdlDate.SelectedDate;

            if (pageData.SelectedRoute != null && pageData.SelectedDate != null)
            {
                service.GetAvailableTripSlots(pageData);
            }

            GvTripSlots.DataBind();
        }
    }
}
