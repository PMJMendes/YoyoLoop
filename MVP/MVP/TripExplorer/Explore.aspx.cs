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
            if (DdlStartRegion.SelectedValue != null || DdlStartRegion.SelectedValue != Guid.Empty.ToString())
            {
                pageData.SourceRegion = pageData.Regions.Where(r => r.LoopedRegionId.ToString() == DdlStartRegion.SelectedValue).FirstOrDefault();
                DdlStartRegion.Items.Remove(DdlStartRegion.Items.FindByValue(Guid.Empty.ToString()));
                DdlEndRegion.DataBind();
                service.GetAccessPoints(pageData);
                DdlStartAP.DataBind();
            }
            else
            {
                pageData.SourceRegion = null;
                pageData.SelectedRoute = null;
                pageData.SelectedSAP = null;
            }
            CheckRoute();
        }

        protected void DdlEndRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlEndRegion.SelectedValue != null || DdlEndRegion.SelectedValue != Guid.Empty.ToString())
            {
                pageData.DestinationRegion = pageData.Regions.Where(r => r.LoopedRegionId.ToString() == DdlEndRegion.SelectedValue).FirstOrDefault();
                DdlEndRegion.Items.Remove(DdlEndRegion.Items.FindByValue(Guid.Empty.ToString()));
                service.GetAccessPoints(pageData);
                DdlEndAP.DataBind();
            }
            else
            {
                pageData.DestinationRegion = null;
                pageData.SelectedRoute = null;
                pageData.SelectedDAP = null;
            }
            CheckRoute();
        }

        protected void DdlStartAP_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlStartAP.SelectedValue == Guid.Empty.ToString()) pageData.SelectedSAP = null;
            else pageData.SelectedSAP = pageData.SourceAccessPoints.Where(sap => sap.AccessPointId.ToString() == DdlStartAP.SelectedValue).FirstOrDefault();
            CheckRoute();
        }

        protected void DdlEndAP_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlEndAP.SelectedValue == Guid.Empty.ToString()) pageData.SelectedDAP = null;
            else pageData.SelectedDAP = pageData.DestinationAccessPoints.Where(dap => dap.AccessPointId.ToString() == DdlEndAP.SelectedValue).FirstOrDefault();
            CheckRoute();
        }

        protected void CalDate_SelectionChanged(object sender, EventArgs e)
        {
            CheckRoute();
        }

        public IQueryable<ListItem> DdlStartRegion_GetData()
        {
            DdlStartRegion.Items.Clear();
            DdlStartRegion.SelectedIndex = -1;
            DdlStartRegion.SelectedValue = null;
            DdlStartAP.Items.Clear();
            DdlStartAP.SelectedIndex = -1;
            DdlStartAP.SelectedValue = null;
            pageData.SourceRegion = null;
            pageData.SelectedRoute = null;
            pageData.TripSlots.Clear();
            GvTripSlots.DataBind();

            return new[] { new ListItem("-", Guid.Empty.ToString()) }.Concat(
                pageData.Routes.Select(r => r.StartRegion).Distinct().
                Select(lr => new ListItem(lr.Name, lr.LoopedRegionId.ToString()))
            ).AsQueryable();
        }

        public IQueryable<ListItem> DdlEndRegion_GetData()
        {
            DdlEndRegion.Items.Clear();
            DdlEndRegion.SelectedIndex = -1;
            DdlEndRegion.SelectedValue = null;
            DdlEndAP.Items.Clear();
            DdlEndAP.SelectedIndex = -1;
            DdlEndAP.SelectedValue = null;
            pageData.DestinationRegion = null;
            pageData.SelectedRoute = null;
            pageData.TripSlots.Clear();
            GvTripSlots.DataBind();

            return new[] { new ListItem("-", Guid.Empty.ToString()) }.Concat(
                pageData.Routes.Where(r => r.StartRegion.LoopedRegionId.ToString() == DdlStartRegion.SelectedValue).
                Select(r => new ListItem(r.EndRegion.Name, r.EndRegion.LoopedRegionId.ToString()))
            ).AsQueryable();
        }

        public IQueryable<ListItem> DdlStartAP_GetData()
        {
            DdlStartAP.Items.Clear();
            DdlStartAP.SelectedIndex = -1;
            DdlStartAP.SelectedValue = null;
            pageData.SelectedSAP = null;

            return new[] { new ListItem("Any", Guid.Empty.ToString()) }.Concat(
                pageData.SourceAccessPoints.Select(ap => new ListItem(ap.Name, ap.AccessPointId.ToString()))
            ).AsQueryable();
        }

        public IQueryable<ListItem> DdlEndAP_GetData()
        {
            DdlEndAP.Items.Clear();
            DdlEndAP.SelectedIndex = -1;
            DdlEndAP.SelectedValue = null;
            pageData.SelectedDAP = null;

            return new[] { new ListItem("Any", Guid.Empty.ToString()) }.Concat(
                pageData.DestinationAccessPoints.Select(ap => new ListItem(ap.Name, ap.AccessPointId.ToString()))
            ).AsQueryable();
        }

        public IQueryable<object> GvTripSlots_GetData()
        {
            return pageData.TripSlots.Select(ts => new
            {
                Departure = ts.Departure,
                SourceRegion = ts.SourceRegion.Name,
                SourceAccessPoint = ts.SourceAccessPoint.Name,
                DestinationRegion = ts.DestinationRegion.Name,
                DestinationAccessPoint = ts.DestinationAccessPoint.Name,
                Arrival = ts.Arrival
            }).AsQueryable();
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
                pageData.SelectedSAP = null;
                pageData.SelectedDAP = null;
                Session["explore.data"] = pageData;
                DateTime dt = DateTime.Today.AddDays(1);
                CalDate.VisibleDate = dt;
                CalDate.SelectedDate = dt;
            }
        }

        private void CheckRoute()
        {
            if (pageData.SourceRegion != null && pageData.DestinationRegion != null)
            {
                pageData.SelectedRoute = pageData.Routes.Where(s => s.StartRegion.LoopedRegionId.ToString() == DdlStartRegion.SelectedValue).
                                                         Where(e => e.EndRegion.LoopedRegionId.ToString() == DdlEndRegion.SelectedValue).FirstOrDefault();
            }

            pageData.SelectedDate = CalDate.SelectedDate;

            if (pageData.SelectedRoute != null)
            {
                service.GetAvailableTripSlots(pageData);
                GvTripSlots.DataBind();
            }
        }
    }
}
