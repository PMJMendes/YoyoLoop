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
            LbStartAP.Visible = false;
            DdlStartAP.Visible = false;
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
            CheckParams();

            List<TimeSpan> departures = service.GetDepartureTimes(pageData);

            DrawTimeSelectionPopup(pageData.Selection.Date, departures);
        }

        protected void CalDate_MonthChange(Object sender, MonthChangedEventArgs e)
        {
            if (CalDate.VisibleDate.Month < DateTime.Today.Month)
            {
                return;
            }

            GetCalendarData();
        }

        protected void CalDate_DayRender(object sender, DayRenderEventArgs e)
        {
            var dayslot = pageData.DaySlots.Where(d => d.Day == e.Day.Date).FirstOrDefault();

            if (dayslot != null)
            {
                e.Day.IsSelectable = true;
                Label lb = new Label();
                lb.Text = " <br>" + dayslot.Price.ToString() + "€";
                switch (dayslot.Status)
                {
                    case DaySlot.DayStatus.RED:
                        lb.ForeColor = System.Drawing.Color.Red;
                        break;
                    case DaySlot.DayStatus.GREEN:
                        lb.ForeColor = System.Drawing.Color.Green;
                        break;
                    case DaySlot.DayStatus.YELLOW:
                        lb.ForeColor = System.Drawing.Color.Yellow;
                        break;
                }
                e.Cell.Controls.Add(lb);
            }
            else
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void BtnDebug_Click(object sender, EventArgs e)
        {
            GvDebug.DataBind();
            GvDebug.Visible = !GvDebug.Visible;
            LbDebug.Visible = !LbDebug.Visible;
        }

        public IEnumerable<ListItem> DdlEndRegion_GetData()
        {
            if (pageData.Routes.Where(r => r.EndRegion.Name == pageData.QueryString.Dest).Count() != 0)
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

        public IEnumerable<object> GvDebug_GetData()
        {
            return pageData.DaySlots;
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
                pageData.QueryString = GetQueryString();
                Session["explore.data"] = pageData;
                
                string dest = pageData.QueryString.Dest;

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

                PnTime.Visible = false;
                CalDate.VisibleDate = DateTime.Today;
            }
        }

        public QueryString GetQueryString()
        {
            var query = Request.QueryString;
            var result = new QueryString();

            if (query["Dest"] != null && query["Dest"] != string.Empty)
            {
                result.Dest = query["Dest"];
            }

            return result;
        }


        private void CheckParams()
        {
            var route = GetPossibleRoutes().Where(r => r.StartRegion.LoopedRegionId.ToString() == DdlStartRegion.SelectedValue).FirstOrDefault();

            if (route == null)
            {
                pageData.Selection.Route = null;
                pageData.DaySlots.Clear();
                PnTime.Visible = false;
                LbDate.Visible = false;
                CalDate.Visible = false;
            }
            else if (pageData.Selection.Route != route)
            {
                // We have a new route selection
                pageData.Selection.Route = route;
                
                GetCalendarData();
            }

            pageData.Selection.SAP = GetPossibleSAPs()?.Where(ap => ap.AccessPointId.ToString() == DdlStartAP.SelectedValue)?.FirstOrDefault();

            pageData.Selection.DAP = GetPossibleDAPs()?.Where(ap => ap.AccessPointId.ToString() == DdlEndAP.SelectedValue)?.FirstOrDefault();

            pageData.Selection.Date = CalDate.SelectedDate;

            //Debug label
            if (pageData.Selection.Route == null)
            {
                LbDebug.Text = "No route selected";
            }
            else
            {
                LbDebug.Text = "Route: " + pageData.Selection.Route.StartRegion.Name + " to " + pageData.Selection.Route.EndRegion.Name + "<br />" +
                               "SAP: " + pageData.Selection.SAP.Name + "<br />" +
                               "DAP: " + pageData.Selection.DAP.Name + "<br />" +
                               "Date: " + pageData.Selection.Date.Date.ToString() + "<br />" +
                               "Time: " + pageData.Selection.Time.ToString();
            }
        }

        private void GetCalendarData()
        {
            DateTime d = new DateTime(CalDate.VisibleDate.Year, CalDate.VisibleDate.Month, 1);
   
            DateTime firstdate = new DateTime();
            DateTime lastdate = new DateTime();

            if (d.DayOfWeek == DayOfWeek.Sunday)
            {
                firstdate = d - TimeSpan.FromDays(6);
            }
            else
            {
                firstdate = d - TimeSpan.FromDays((int)d.DayOfWeek - 1);    
            }

            lastdate = firstdate + TimeSpan.FromDays(41);

            pageData.DaySlots = service.GetDaySlots(pageData, firstdate, lastdate);

            //Debug
            GvDebug.DataBind();

            LbDate.Visible = true;
            CalDate.Visible = true;

            return;
        }

        private void DrawTimeSelectionPopup(DateTime date, List<TimeSpan> times)
        {
            LbPnTimeTextDate.Text = date.ToString("dd") + " de " + date.ToString("MMMM") + "<br />";

            times.Sort();
            int i = 0;
            foreach(TimeSpan t in times)
            { 
                var button = new Button();
                button.Click += BtnDepartureClick;
                button.ID = t.ToString();
                button.Text = t.ToString("hh\\:mm");
                button.Visible = true;
                var id = "PH" + i.ToString();
                PnTime.FindControl(id).Controls.Add(button);
                i++;
            }

            PnTime.Visible = true;
        }

        private void BtnDepartureClick(object sender, EventArgs e)
        {
            LbDebug.Text = "Time: " + sender.ToString();
            PnTime.Visible = false;
            CalDate.SelectedDate = DateTime.MinValue;
        }

        private IEnumerable<Route> GetPossibleRoutes()
        {
            return pageData.Routes.Where(r => r.EndRegion.LoopedRegionId.ToString() == DdlEndRegion.SelectedValue);
        }

        private IEnumerable<AccessPoint> GetPossibleSAPs()
        {
            return GetPossibleRoutes().Where(r => r.StartRegion.LoopedRegionId.ToString() == DdlStartRegion.SelectedValue)
                                      .Select(r => r.StartRegion).Distinct().FirstOrDefault()?.AccessPoints;
        }

        private IEnumerable<AccessPoint> GetPossibleDAPs()
        {
            return GetPossibleRoutes().Where(r => r.EndRegion.LoopedRegionId.ToString() == DdlEndRegion.SelectedValue)
                                      .Select(r => r.EndRegion).Distinct().FirstOrDefault()?.AccessPoints;
        }
    }
}
