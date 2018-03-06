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
            DdlEndAP.SelectedValue = GetPossibleDAPs()?.Where(ap => ap.Default).Select(ap => ap.AccessPointId.ToString()).FirstOrDefault();
            LbEndAP.Visible = true;
            DdlEndAP.Visible = true;

            CheckParams();
        }

        protected void DdlStartRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlStartRegion.SelectedValue != Guid.Empty.ToString())
            {
                DdlStartRegion.Items.Remove(DdlStartRegion.Items.FindByValue(Guid.Empty.ToString()));
            }

            DdlStartAP.DataBind();
            DdlStartAP.SelectedValue = GetPossibleSAPs()?.Where(ap => ap.Default).Select(ap => ap.AccessPointId.ToString()).FirstOrDefault();
            LbStartAP.Visible = true;
            DdlStartAP.Visible = true;

            CheckParams();
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
            // Validate selected date first (nothing in the past, we have something to show, etc)

            pageData.Selection.Date = CalDate.SelectedDate;

            DrawTimePopup();   
        }

        protected void CalDate_MonthChange(Object sender, MonthChangedEventArgs e)
        {
            //Debug
            LbDebug.Visible = true;
            LbDebug.Text = e.NewDate.Month.ToString();

            pageData.MonthDaySlots = service.GetAvailableMonthDaySlots(pageData, CalDate.VisibleDate);
            DrawCalendar();
        }

        protected void DdlTime_SelectedIndexChanged(object sender, EventArgs e) // [OBSOLETE]
        {
            CheckParams();
        }

        protected void BtnDebug_Click(object sender, EventArgs e)
        {
            GvDebug.DataBind();
            GvDebug.Visible = !GvDebug.Visible;
        }

        protected void GvDebug_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "Select")
            {

                GridViewRow row = GvDebug.Rows[Convert.ToInt32(e.CommandArgument)];

                //Debug Label
                LbDebug.Text = row.Cells[0].Text;
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
            return GetPossibleDAPs()?.Select(ap => new ListItem(ap.Name, ap.AccessPointId.ToString())) ?? Enumerable.Empty<ListItem>();
        }

        public IEnumerable<ListItem> DdlStartAP_GetData()
        {
            return GetPossibleSAPs()?.Select(ap => new ListItem(ap.Name, ap.AccessPointId.ToString())) ?? Enumerable.Empty<ListItem>();
        }

        public IEnumerable<String> DdlTime_GetData()  // [OBSOLETE]
        {
            yield return Properties.Strings.AnyTime;

            var route = pageData.Selection.Route;

            if (route == null)
            {
                yield break;
            }

            foreach (Departure d in route.Departures)
            {
                yield return d.Time.ToString("hh\\:mm");
            }
        }

        public IEnumerable<object> GvDebug_GetData()
        {
            return pageData.MonthDaySlots;
        

            /* [OBSOLETE] AvailableTripSlots - needs to be moved to the GetAvailableTripSlots service but currently depends on page methods
             (GetPossibleSAPs/DAPs) that depend on pagecontrols selected values 
            
            var sourceAccessPoints = pageData.SelectedSAP == null ? GetPossibleSAPs() : new[] { pageData.SelectedSAP };
            var destinationAccessPoints = pageData.SelectedDAP == null ? GetPossibleDAPs() : new[] { pageData.SelectedDAP };

            pageData.AvailableTripSlots = pageData.AvailableTripSlots.Where(dt => pageData.SelectedRoute != null).
                SelectMany(dt => sourceAccessPoints.SelectMany(sap => destinationAccessPoints.Select(dap => new TripSlot
            (
                dt.Departure,
                sap.Region,
                dap.Region,
                sap,
                dap,
                dt.Departure + pageData.SelectedRoute.Duration
            )))).ToList();

            return pageData.AvailableTripSlots.Select(ts => new
            {
                ts.Departure,
                SourceRegion = ts.SourceRegion.Name,
                SourceAccessPoint = ts.SourceAccessPoint.Name,
                DestinationRegion = ts.DestinationRegion.Name,
                DestinationAccessPoint = ts.DestinationAccessPoint.Name,
                ts.Arrival
            });
            */
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
                
                //check query string
                string dest = Request.QueryString["Dest"];

                if (dest != null && dest != string.Empty)
                {
                    if (pageData.Routes.Where(r => r.EndRegion.Name == dest).Count() != 0)
                    {
                        DdlEndRegion.SelectedValue = pageData.Routes.Where(r => r.EndRegion.Name == dest).Select(er => er.EndRegion).FirstOrDefault().LoopedRegionId.ToString();
                        DdlEndAP.SelectedValue = pageData.Routes.Where(r => r.EndRegion.Name == dest).FirstOrDefault()?.EndRegion?.AccessPoints?
                                                                .Where(ap => ap.Default)
                                                                .Select(ap => ap.AccessPointId).FirstOrDefault().ToString();
                        LbEndAP.Visible = true;
                        DdlEndAP.Visible = true;
                    }
                }
            }
        }

        private void CheckParams()
        {
            if (pageData.Selection.Route != GetPossibleRoutes().Where(r => r.StartRegion.LoopedRegionId.ToString() == DdlStartRegion.SelectedValue).FirstOrDefault())
            {
                // We have a new route selection
                pageData.Selection.Route = GetPossibleRoutes().Where(r => r.StartRegion.LoopedRegionId.ToString() == DdlStartRegion.SelectedValue).FirstOrDefault();
                pageData.MonthDaySlots = service.GetAvailableMonthDaySlots(pageData, CalDate.VisibleDate);

                DrawCalendar();
            }

            pageData.Selection.SAP = GetPossibleSAPs()?.Where(ap => ap.AccessPointId.ToString() == DdlStartAP.SelectedValue)?.FirstOrDefault();

            pageData.Selection.DAP = GetPossibleDAPs()?.Where(ap => ap.AccessPointId.ToString() == DdlEndAP.SelectedValue)?.FirstOrDefault();

        }
        private void DrawCalendar()
        {

            LbDate.Visible = true;
            CalDate.Visible = true;

            return;
        }

        private void DrawTimePopup()
        {
            return;
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
