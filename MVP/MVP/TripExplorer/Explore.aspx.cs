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
            pageData.CalendarVisibleMonth = new DateTime(CalDate.VisibleDate.Year, CalDate.VisibleDate.Month, 1);

            GetCalendarData();
        }

        protected void DdlSeats_SelectedIndexChanged(object sender, EventArgs e)
        {
            CheckParams();
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
            if (pageData.Routes.Where(r => r.EndRegion.LoopedRegionId == pageData.QueryData.EndRegionId).Count() != 0)
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
                pageData.QueryData = GetQueryString();
                Session["explore.data"] = pageData;

                Guid? dest = pageData.QueryData.EndRegionId;

                if (dest != null && dest != Guid.Empty)
                {
                    if (pageData.Routes.Where(r => r.EndRegion.LoopedRegionId == dest).Count() != 0)
                    {
                        DdlEndRegion.SelectedValue = pageData.Routes.Where(r => r.EndRegion.LoopedRegionId == dest).Select(er => er.EndRegion).FirstOrDefault().LoopedRegionId.ToString();
                        DdlEndAP.SelectedValue = pageData.Routes.Where(r => r.EndRegion.LoopedRegionId == dest).FirstOrDefault()?.EndRegion?.AccessPoints?
                                                                .Where(ap => ap.Default)
                                                                .Select(ap => ap.AccessPointId).FirstOrDefault().ToString();
                        LbEndAP.Visible = true;
                        DdlEndAP.Visible = true;
                    }
                }

                PnTime.Visible = false;
                PnBook.Visible = false;
                CalDate.VisibleDate = DateTime.Today;
                CalDate.SelectedDate = DateTime.MinValue;
            }
        }

        public QueryData GetQueryString()
        {
            var query = Request.QueryString;
            var result = new QueryData();

            if (query["Dest"] != null && query["Dest"] != string.Empty)
            {
                result.EndRegionId = pageData.Routes.Where(r => r.EndRegion.Name == query["Dest"]).Select(er => er.EndRegion).FirstOrDefault()?.LoopedRegionId;
            }

            return result;
        }

        private void CheckParams()
        {
            var route = GetPossibleRoutes().Where(r => r.StartRegion.LoopedRegionId.ToString() == DdlStartRegion.SelectedValue).FirstOrDefault();
            var sap = GetPossibleSAPs()?.Where(ap => ap.AccessPointId.ToString() == DdlStartAP.SelectedValue)?.FirstOrDefault();
            var dap = GetPossibleDAPs()?.Where(ap => ap.AccessPointId.ToString() == DdlEndAP.SelectedValue)?.FirstOrDefault();
            bool calupdate = false;
            bool bookupdate = false;

            if (route == null)
            {
                pageData.Selection = new Selection
                {
                    Route = null,
                    SAP = null,
                    DAP = null,
                    Date = DateTime.MinValue,
                    Time = new TimeSpan(-1),
                    Price = 0,
                    Seats = 1,
                    Trip = null
                };
                pageData.DaySlots.Clear();
                PnTime.Visible = false;
                LbDate.Visible = false;
                PnBook.Visible = false;
                CalDate.Visible = false;
                CalDate.SelectedDate = DateTime.MinValue;
                LbSeats.Visible = false;
                DdlSeats.Visible = false;
                DdlSeats.SelectedValue = "1";
            }
            else if (pageData.Selection.Route != route)  // We have a new route selection
            {
                pageData.Selection.Route = route;
                CalDate.SelectedDate = DateTime.MinValue;
                PnTime.Visible = false;
                PnBook.Visible = false;
                DdlSeats.SelectedValue = "1";
                LbSeats.Visible = true;
                DdlSeats.Visible = true;

                calupdate = true;
            }

            if (pageData.Selection.SAP != sap) // we have a new sap
            {
                pageData.Selection.SAP = sap;

                if (route != null)
                {
                    calupdate = true; // we need to redraw calendar cause daystatus may have changed
                    if (PnBook.Visible)
                    {
                        bookupdate = true;
                    }
                }
            }

            if (pageData.Selection.SAP != dap) // we have a new dap
            {
                pageData.Selection.DAP = dap;

                if (route != null)
                {
                    calupdate = true; // we need to redraw calendar cause daystatus may have changed
                    if (PnBook.Visible)
                    {
                        bookupdate = true;
                    }
                }
            }

            if (CalDate.SelectedDate != DateTime.MinValue)
            {
                pageData.Selection.Date = CalDate.SelectedDate;
                pageData.Selection.Price = pageData.DaySlots.Where(d => d.Day == pageData.Selection.Date).Select(p => p.Price).First();
                if (route != null)
                {
                    if (PnBook.Visible)
                    {
                        bookupdate = true;
                    }
                }
            }

            if (DdlSeats.SelectedValue != pageData.Selection.Seats.ToString())
            {
                pageData.Selection.Seats = int.Parse(DdlSeats.SelectedValue);

                if (route != null)
                {
                    calupdate = true; // we need to redraw calendar cause daystatus may have changed
                    if (PnBook.Visible)
                    {
                        bookupdate = true;
                    }
                }
            }

            if (pageData.Selection.Time != new TimeSpan(-1))
            {
                bookupdate = true;
            }

            if (calupdate)
            {
                GetCalendarData();
            }

            if (bookupdate)
            {
                UpdateBookingPanel();
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
                    LbDebug.Text += "Time: " + pageData.Selection.Time.ToString() + "<br />";
                }
                else
                {
                    LbDebug.Text += "Time: <br />";
                }
                if (pageData.Selection.Price != 0)
                {
                    LbDebug.Text += "Price: " + pageData.Selection.Price.ToString() + "€<br />";
                }
                else
                {
                    LbDebug.Text += "Price: <br/>";
                }
                if (pageData.Selection.Seats != 0)
                {
                    LbDebug.Text += "Seats: " + pageData.Selection.Seats.ToString();
                }
                else
                {
                    LbDebug.Text += "Seats: ";
                }
            }
        }

        private void GetCalendarData()
        {
            if (pageData.CalendarVisibleMonth.Month < DateTime.Today.Month) // we may have a display bug here when past month still shows available dates
            {
                return;
            }

            DateTime d = pageData.CalendarVisibleMonth;
            DateTime firstdate;

            if (d.DayOfWeek == DayOfWeek.Sunday)
            {
                firstdate = d - TimeSpan.FromDays(6);
            }
            else
            {
                firstdate = d - TimeSpan.FromDays((int)d.DayOfWeek - 1);
            }

            DateTime lastdate = firstdate + TimeSpan.FromDays(41);

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
            IEnumerable<Button> buttons = new List<Button>() { BtnTime1,
                                                               BtnTime2,
                                                               BtnTime3,
                                                               BtnTime4,
                                                               BtnTime5,
                                                               BtnTime6 }; // this is horrible - need to find a way to get TbDepartures.Controls.OfType<Button> to recursively drill into child containers

            foreach(Button b in buttons)
            {
                b.Visible = false;
            }

            slots = slots.OrderBy(t => t.Time).ToList();

            LbPnTimeTextDate.Text = date.ToString("MMM").ToUpper() + " " + date.ToString("dd") + "<br />";

            for (int i = 1; i <= Math.Min(slots.Count(), buttons.Count()); i++ )
            {
                Button button = buttons.Where(b => b.ID == "BtnTime" + i.ToString()).First();
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

        protected void BtnTime_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            PnTime.Visible = false;
            pageData.Selection.Time = TimeSpan.Parse(button.Text);
            CalDate.SelectedDate = DateTime.MinValue;
            CheckParams(); 
        }

        private void UpdateBookingPanel()
        {
            LbDepartureDate.Text = pageData.Selection.Date.Date.ToString("d MMM, ddd").ToUpper();
            if(pageData.Selection.Time == new TimeSpan(-1))
            {
                LbDepartureTime.Text = "";
            }
            else
            {
                LbDepartureTime.Text = pageData.Selection.Time.ToString("hh\\:mm") + "h";
            }
            LbDepartureSeats.Text = pageData.Selection.Seats.ToString() + " passenger(s)";
            LbDepartureTo.Text = "To: " + pageData.Selection.Route.EndRegion.Name + " / " + pageData.Selection.DAP.Name;
            LbDepartureFrom.Text = "From: " + pageData.Selection.Route.StartRegion.Name + " / " + pageData.Selection.SAP.Name;
            LbDepartureSeatCost.Text = pageData.Selection.Seats.ToString() + " Seat(s) x " + pageData.Selection.Price.ToString() + "€";
            LbDepartureBookCost.Text = (pageData.Selection.Seats * pageData.Selection.Price).ToString() + "€";

            if (pageData.Selection.Route != null &&
                pageData.Selection.Date != DateTime.MinValue &&
                pageData.Selection.Time != new TimeSpan(-1) &&
                pageData.Selection.Seats != 0 &&
                pageData.Selection.Price != 0)
            {
                BtnDepartureBook.ForeColor = System.Drawing.Color.Green;
                BtnDepartureBook.Enabled = true;
            }
            else
            {
                BtnDepartureBook.ForeColor = System.Drawing.Color.Red;
                BtnDepartureBook.Enabled = false;
            }

            PnBook.Visible = true;
        }

        protected void BtnDepartureBook_Click(object sender, EventArgs e)
        {
            var booking = service.CreateBooking(pageData);

            // Will send to the payment confirmation page, for now we use a debug panel to handle payment status
            BtnDepartureBook.Enabled = false;
            LbDebugPayBookingID.Text = booking.BookingId.ToString();
            PnDebugPay.Visible = true;
        }

        protected void BtnDebugPay_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            switch(button.Text)
            {
                case "PAY":
                    service.UpdateBooking(Guid.Parse(LbDebugPayBookingID.Text), BookingStatus.BOOKED);
                    break;
                case "CANCEL":
                    service.UpdateBooking(Guid.Parse(LbDebugPayBookingID.Text), BookingStatus.CANCELLED);
                    break;
                case "IGNORE":
                    break;
            }
            PnDebugPay.Visible = false;
            PnBook.Visible = false;
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
