using MVP.Services;
using MVP.Models;
using MVP.Models.Entities;
using System;
using System.Linq;
using System.Web.UI;
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
            pageData.Selection.Time = new TimeSpan(-1); // date changed, we need to clear selected time
            CheckParams();

            DrawTimeSelectionPopup(pageData.Selection.Date, service.GetTimeSlots(pageData));
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
                    case SlotStatus.RED:
                        lb.ForeColor = System.Drawing.Color.Red;
                        break;
                    case SlotStatus.GREEN:
                        lb.ForeColor = System.Drawing.Color.Green;
                        break;
                    case SlotStatus.YELLOW:
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
                CalDate.SelectedDate = DateTime.MinValue;
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
            var sap = GetPossibleSAPs()?.Where(ap => ap.AccessPointId.ToString() == DdlStartAP.SelectedValue)?.FirstOrDefault();
            var dap = GetPossibleDAPs()?.Where(ap => ap.AccessPointId.ToString() == DdlEndAP.SelectedValue)?.FirstOrDefault();

            if (route == null)
            {
                pageData.Selection = new Selection
                {
                    Route = null,
                    SAP = null,
                    DAP = null,
                    Date = DateTime.MinValue,
                    Time = new TimeSpan(-1)
                };
                pageData.DaySlots.Clear();
                PnTime.Visible = false;
                LbDate.Visible = false;
                CalDate.Visible = false;
                CalDate.SelectedDate = DateTime.MinValue;
            }
            else if (pageData.Selection.Route != route)  // We have a new route selection
            {
                pageData.Selection.Route = route;

                GetCalendarData();
            }

            if (pageData.Selection.SAP != sap) // we have a new sap
            {
                pageData.Selection.SAP = sap;

                if (route != null)
                {
                    GetCalendarData(); // we need to redraw calendar cause daystatus may have changed
                }
            }

            if (pageData.Selection.SAP != dap) // we have a new dap
            {
                pageData.Selection.DAP = dap;

                if (route != null)
                {
                    GetCalendarData(); // we need to redraw calendar cause daystatus may have changed
                }
            }

            if (CalDate.SelectedDate != DateTime.MinValue)
            {
                pageData.Selection.Date = CalDate.SelectedDate;
            }

            //Debug label
            if (pageData.Selection.Route == null)
            {
                LbDebug.Text = "No route selected";
            }
            else
            {
                LbDebug.Text = "Route: " + pageData.Selection.Route.StartRegion.Name + " to " + pageData.Selection.Route.EndRegion.Name + "<br />" +
                               "SAP: " + pageData.Selection.SAP.Name + "<br />" +
                               "DAP: " + pageData.Selection.DAP.Name + "<br />";
                if (pageData.Selection.Date != DateTime.MinValue)
                {
                    LbDebug.Text += "Date: " + pageData.Selection.Date.ToString("dd-MMM-yyyy") + "<br />";
                }
                else
                {
                    LbDebug.Text += "Date: <br />";
                }
                if (pageData.Selection.Time != new TimeSpan(-1))
                {
                    LbDebug.Text += "Time: " + pageData.Selection.Time.ToString();
                }
                else
                {
                    LbDebug.Text += "Time: ";
                }
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

            LbDate.Visible = true;
            CalDate.Visible = true;

            if (PnTime.Visible) // if time selection popup is visible, update it
            {
                DrawTimeSelectionPopup(pageData.Selection.Date, service.GetTimeSlots(pageData));
            }

            //Debug
            GvDebug.DataBind();

            return;
        }

        private void DrawTimeSelectionPopup(DateTime date, List<TimeSlot> slots)
        {
            IEnumerable<Button> buttons = new List<Button>() { BtnDeparture1,
                                                               BtnDeparture2,
                                                               BtnDeparture3,
                                                               BtnDeparture4,
                                                               BtnDeparture5,
                                                               BtnDeparture6 }; // this is horrible - need to find a way to get TbDepartures.Controls.OfType<Button> to recursively drill into child containers

            foreach(Button b in buttons)
            {
                b.Visible = false;
            }

            slots = slots.OrderBy(t => t.Time).ToList();

            LbPnTimeTextDate.Text = date.ToString("MMM").ToUpper() + " " + date.ToString("dd") + "<br />";

            for (int i = 1; i <= Math.Min(slots.Count(), buttons.Count()); i++ )
            {
                Button button = buttons.Where(b => b.ID == "BtnDeparture" + i.ToString()).First();
                button.Text = slots.ElementAt(i-1).Time.ToString("hh\\:mm");
                switch (slots.ElementAt(i - 1).Status)
                {
                    case SlotStatus.RED:
                        button.ForeColor = System.Drawing.Color.Red;
                        button.Enabled = false;
                        break;
                    case SlotStatus.GREEN:
                        button.ForeColor = System.Drawing.Color.Green;
                        button.Enabled = true;
                        break;
                    case SlotStatus.YELLOW:
                        button.ForeColor = System.Drawing.Color.Yellow;
                        button.Enabled = true;
                        break;
                }
                button.Visible = true;
            }

            PnTime.Visible = true;
        }

        protected void BtnDeparture_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            PnTime.Visible = false;
            pageData.Selection.Time = TimeSpan.Parse(button.Text);
            CalDate.SelectedDate = DateTime.MinValue;
            CheckParams(); //Dont really know where I'll go here - this will do for now
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
