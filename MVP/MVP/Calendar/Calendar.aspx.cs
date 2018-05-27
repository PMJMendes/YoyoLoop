using MVP.Services;
using MVP.Controls;
using MVP.Models;
using MVP.Models.Entities;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace MVP.Calendar
{
    public partial class Calendar : System.Web.UI.Page
    {
        public class PageState
        {
            public Selection Values { get; set; }

            public class Selection
            {
                public string StartRegion { get; set; }
                public string StartAP { get; set; }
                public string EndRegion { get; set; }
                public string EndAP { get; set; }
                public string Seats { get; set; }
                public DateTime CalSelectedDate { get; set; }
                public DateTime CalVisibleDate { get; set; }
                public TimeSpan Time { get; set; }
            }
        }

        private readonly CalendarService service = new CalendarService();

        CalendarDTO pageData;
        PageState localData;

        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
        }

        protected void DdlEndRegion_ItemSelected(object sender, DropdownMenuButton.ItemSelectedEventArgs e)
        {
            localData.Values.EndRegion = e.Item.ToString();
            DdlStartRegion.DataSource = DdlStartRegion_GetData();
            DdlStartRegion.ListDataBind();
            localData.Values.StartRegion = Guid.Empty.ToString();
            localData.Values.StartAP = Guid.Empty.ToString();
            DdlStartRegion.SelectedText = "";
            DdlStartAP.SelectedText = "";
            DdlEndAP.DataSource = DdlEndAP_GetData();
            DdlEndAP.ListDataBind();
            var aps = GetPossibleDAPs()?.Where(ap => ap.Default);
            localData.Values.EndAP = aps.Select(ap => ap.AccessPointId.ToString()).FirstOrDefault();
            DdlEndAP.SelectedText = aps.Select(ap => ap.Name).FirstOrDefault();

            CheckParams();
        }

        protected void DdlStartRegion_ItemSelected(object sender, DropdownMenuButton.ItemSelectedEventArgs e)
        {
            localData.Values.StartRegion = e.Item.ToString();
            DdlStartAP.DataSource = DdlStartAP_GetData();
            DdlStartAP.ListDataBind();
            var aps = GetPossibleSAPs()?.Where(ap => ap.Default);
            localData.Values.StartAP = aps.Select(ap => ap.AccessPointId.ToString()).FirstOrDefault();
            DdlStartAP.SelectedText = aps.Select(ap => ap.Name).FirstOrDefault();

            CheckParams();
        }

        protected void DdlEndAP_ItemSelected(object sender, DropdownMenuButton.ItemSelectedEventArgs e)
        {
            localData.Values.EndAP = e.Item.ToString();

            CheckParams();
        }

        protected void DdlStartAP_ItemSelected(object sender, DropdownMenuButton.ItemSelectedEventArgs e)
        {
            localData.Values.StartAP = e.Item.ToString();

            CheckParams();
        }

        protected void DdlSeats_ItemSelected(object sender, DropdownMenuButton.ItemSelectedEventArgs e)
        {
            localData.Values.Seats = e.Item.ToString();

            CheckParams();
        }

        //protected void CalDate_SelectionChanged(object sender, EventArgs e)
        //{
        //    localData.Values.CalSelectedDate = CalDate.SelectedDate;
        //    pageData.Selection.Time = new TimeSpan(-1); // CHANGE & MOVE ; date changed, we need to clear selected time
        //    CheckParams();
        //
        //    DrawTimeSelectionPopup(pageData.Selection.Date, service.GetTimeSlots(pageData)); // MOVE
        //}

        //protected void CalDate_MonthChange(Object sender, MonthChangedEventArgs e)
        //{
        //    localData.Values.CalVisibleDate = new DateTime(CalDate.VisibleDate.Year, CalDate.VisibleDate.Month, 1);
        //
        //    GetCalendarData();
        //}

        //protected void BtnTime_Click(object sender, EventArgs e)
        //{
        //    Button button = (Button)sender;
        //    PnTime.Visible = false;
        //    localData.Values.Time = TimeSpan.Parse(button.Text);
        //    CheckParams();
        //    CalDate.SelectedDate = DateTime.MinValue; // we need to make the date selectable again
        //}

        //protected void BtnDepartureBook_Click(object sender, EventArgs e)
        //{
        //    var booking = service.CreateBooking(pageData);

        //    // Will send to the payment confirmation page, for now we use a debug panel to handle payment status
        //    BtnDepartureBook.Enabled = false;
        //    LbDebugPayBookingID.Text = booking.BookingId.ToString();
        //    PnDebugPay.Visible = true;
        //}

        //protected void BtnDebugPay_Click(object sender, EventArgs e)
        //{
        //    Button button = (Button)sender;
        //    switch (button.Text)
        //    {
        //        case "PAY":
        //            service.UpdateBooking(Guid.Parse(LbDebugPayBookingID.Text), BookingStatus.BOOKED);
        //            break;
        //        case "CANCEL":
        //            service.UpdateBooking(Guid.Parse(LbDebugPayBookingID.Text), BookingStatus.CANCELLED);
        //            break;
        //        case "IGNORE":
        //            break;
        //    }
        //    PnDebugPay.Visible = false;
        //    PnBook.Visible = false;
        //}

        //protected void BtnDebug_Click(object sender, EventArgs e)
        //{
        //    Button button = (Button)sender;
        //    switch (button.Text)
        //    {
        //        case "Debug":
        //            GetDebugData();
        //            GvDebug.DataBind();
        //            GvDebug.Visible = true;
        //            LbDebug.Visible = true;
        //            BtnDebugOff.Visible = true;
        //            break;
        //        case "OFF":
        //            GvDebug.Visible = false;
        //            LbDebug.Visible = false;
        //            BtnDebugOff.Visible = false;
        //            break;
        //    }
        //}

        private IEnumerable<ListItem> DdlEndRegion_GetData()
        {
            return pageData.Routes.Select(r => r.EndRegion).Distinct().Select(lr => new ListItem(lr.Name, lr.LoopedRegionId.ToString()));
        }

        public IEnumerable<ListItem> DdlStartRegion_GetData()
        {
            return GetPossibleRoutes().Select(r => r.StartRegion).Distinct().Select(lr => new ListItem(lr.Name, lr.LoopedRegionId.ToString()));
        }

        public IEnumerable<ListItem> DdlEndAP_GetData()
        {
            return GetPossibleDAPs()?.Select(ap => new ListItem(ap.Name, ap.AccessPointId.ToString())) ?? Enumerable.Empty<ListItem>();
        }

        public IEnumerable<ListItem> DdlStartAP_GetData()
        {
            return GetPossibleSAPs()?.Select(ap => new ListItem(ap.Name, ap.AccessPointId.ToString())) ?? Enumerable.Empty<ListItem>();
        }

        public IEnumerable<ListItem> DdlSeats_GetData()
        {
            return new List<ListItem>  { new ListItem("1", "1"),
                                         new ListItem("2", "2"),
                                         new ListItem("3", "3"),
                                         new ListItem("4", "4"),
                                         new ListItem("5", "5"),
                                         new ListItem("6", "6"),
                                         new ListItem("7", "7")};
        }

        private void InitData()
        {
            pageData = null;
            localData = null;

            if (IsPostBack)
            {
                pageData = (CalendarDTO)Session["calendar.data"];
                localData = (PageState)Session["local.data"];
            }

            if (pageData == null)
            {
                pageData = service.GetInitialData();
                Session["calendar.data"] = pageData;
            }

            if (localData == null)
            {
                localData = GetInitialData();
                InitializeControls();
                ProcessQueryString();
                Session["local.data"] = localData;
            }

            GetDebugData();
        }

        public IEnumerable<object> GvDebug_GetData()
        {
            return pageData.DaySlots;
        }

        private void CheckParams()
        {
            var route = GetPossibleRoutes().Where(r => r.StartRegion.LoopedRegionId.ToString() == localData.Values.StartRegion).FirstOrDefault();
            var sap = GetPossibleSAPs()?.Where(ap => ap.AccessPointId.ToString() == localData.Values.StartAP)?.FirstOrDefault();
            var dap = GetPossibleDAPs()?.Where(ap => ap.AccessPointId.ToString() == localData.Values.EndAP)?.FirstOrDefault();
            //    bool calupdate = false;
            //    bool bookupdate = false;

            if (route == null)
            {
                ClearSelection();
                //CalDate.SelectedDate =
                localData.Values.CalSelectedDate = DateTime.MinValue;
                DdlSeats.SelectedText =
                localData.Values.Seats = "1";
            }
            else
            {
                if (pageData.Selection.Route != route)  // New Route
                {
                    pageData.Selection.Route = route;
                    //CalDate.SelectedDate =
                    pageData.Selection.Date =
                    localData.Values.CalSelectedDate = DateTime.MinValue;
                    DdlSeats.SelectedText =
                    localData.Values.Seats = "1";
                    pageData.Selection.Seats = 1;

                    //calupdate = true;
                }

                if (pageData.Selection.SAP != sap) // New SAP
                {
                    pageData.Selection.SAP = sap;
                    //calupdate = true; // we need to redraw calendar cause daystatus may have changed; this may no longer be true
                    //if (PnBook.Visible)
                    //{
                    //    bookupdate = true;
                    //}
                }

                if (pageData.Selection.DAP != dap) // New DAP
                {
                    pageData.Selection.DAP = dap;
                    //calupdate = true; // we need to redraw calendar cause daystatus may have changed; this may no longer be true
                    //if (PnBook.Visible)
                    //{
                    //    bookupdate = true;
                    //}
                }

                if (pageData.Selection.Date != localData.Values.CalSelectedDate) // New date
                {
                    pageData.Selection.Date = localData.Values.CalSelectedDate;
                    pageData.Selection.Price = pageData.DaySlots.Where(d => d.Day == pageData.Selection.Date).Select(p => p.Price).First();
                    //if (PnBook.Visible)
                    //{
                    //    bookupdate = true;
                    //}
                }

                if (pageData.Selection.Seats.ToString() != localData.Values.Seats) // New seats
                {
                    pageData.Selection.Seats = int.Parse(localData.Values.Seats);
                    //calupdate = true; // we need to redraw calendar cause daystatus may have changed
                    //if (PnBook.Visible)
                    //{
                    //    bookupdate = true;
                    //}
                }

                if (pageData.Selection.Time != localData.Values.Time) // New time
                {
                    pageData.Selection.Time = localData.Values.Time;
                    //bookupdate = true;
                }
            }

            //    if (calupdate)
            //    {
            //        GetCalendarData();
            //    }

            //    if (bookupdate)
            //    {
            //        UpdateBookingPanel();
            //    }

            //    GetDebugData();
        }

            //private void GetCalendarData()
            //{
            //    if (localData.Values.CalVisibleDate.Month < DateTime.Today.Month) // we may have a display bug here when past month still shows available dates
            //    {
            //        return;
            //    }

            //    DateTime d = localData.Values.CalVisibleDate;
            //    DateTime firstdate;

            //    if (d.DayOfWeek == DayOfWeek.Sunday)
            //    {
            //        firstdate = d - TimeSpan.FromDays(6);
            //    }
            //    else
            //    {
            //        firstdate = d - TimeSpan.FromDays((int)d.DayOfWeek - 1);
            //    }

            //    DateTime lastdate = firstdate + TimeSpan.FromDays(41);

            //    pageData.DaySlots = service.GetDaySlots(pageData, firstdate, lastdate);

            //    PnDate.Visible = true;

            //    if (PnTime.Visible) // if time selection popup is visible, update it
            //    {
            //        DrawTimeSelectionPopup(pageData.Selection.Date, service.GetTimeSlots(pageData));
            //    }

            //    return;
            //}

            //private void DrawTimeSelectionPopup(DateTime date, List<TimeSlot> slots)
            //{
            //    IEnumerable<Button> buttons = new List<Button>() { BtnTime1,
            //                                                       BtnTime2,
            //                                                       BtnTime3,
            //                                                       BtnTime4,
            //                                                       BtnTime5,
            //                                                       BtnTime6 }; // this is horrible - need to find a way to get TbDepartures.Controls.OfType<Button> to recursively drill into child containers

            //    foreach (Button b in buttons)
            //    {
            //        b.Visible = false;
            //    }

            //    slots = slots.OrderBy(t => t.Time).ToList();

            //    LbPnTimeTextDate.Text = date.ToString("MMM").ToUpper() + " " + date.ToString("dd") + "<br />";

            //    for (int i = 1; i <= Math.Min(slots.Count(), buttons.Count()); i++)
            //    {
            //        Button button = buttons.Where(b => b.ID == "BtnTime" + i.ToString()).First();
            //        button.Text = slots.ElementAt(i - 1).Time.ToString("hh\\:mm");
            //        switch (slots.ElementAt(i - 1).Status)
            //        {
            //            case SlotStatus.RED:
            //                button.ForeColor = System.Drawing.Color.Red;
            //                button.Enabled = false;
            //                break;
            //            case SlotStatus.GREEN:
            //                button.ForeColor = System.Drawing.Color.Green;
            //                button.Enabled = true;
            //                break;
            //            case SlotStatus.YELLOW:
            //                button.ForeColor = System.Drawing.Color.Yellow;
            //                button.Enabled = true;
            //                break;
            //        }
            //        button.Visible = true;
            //    }

            //    PnTime.Visible = true;
            //}

            //private void UpdateBookingPanel()
            //{
            //    LbDepartureDate.Text = pageData.Selection.Date.Date.ToString("d MMM, ddd").ToUpper();
            //    if (pageData.Selection.Time == new TimeSpan(-1))
            //    {
            //        LbDepartureTime.Text = "";
            //    }
            //    else
            //    {
            //        LbDepartureTime.Text = pageData.Selection.Time.ToString("hh\\:mm") + "h";
            //    }
            //    LbDepartureSeats.Text = pageData.Selection.Seats.ToString() + " passenger(s)";
            //    LbDepartureTo.Text = "To: " + pageData.Selection.Route.EndRegion.Name + " / " + pageData.Selection.DAP.Name;
            //    LbDepartureFrom.Text = "From: " + pageData.Selection.Route.StartRegion.Name + " / " + pageData.Selection.SAP.Name;
            //    LbDepartureSeatCost.Text = pageData.Selection.Seats.ToString() + " Seat(s) x " + pageData.Selection.Price.ToString() + "€";
            //    LbDepartureBookCost.Text = (pageData.Selection.Seats * pageData.Selection.Price).ToString() + "€";

            //    if (pageData.Selection.Route != null &&
            //        pageData.Selection.Date != DateTime.MinValue &&
            //        pageData.Selection.Time != new TimeSpan(-1) &&
            //        pageData.Selection.Seats != 0 &&
            //        pageData.Selection.Price != 0)
            //    {
            //        BtnDepartureBook.ForeColor = System.Drawing.Color.Green;
            //        BtnDepartureBook.Enabled = true;
            //    }
            //    else
            //    {
            //        BtnDepartureBook.ForeColor = System.Drawing.Color.Red;
            //        BtnDepartureBook.Enabled = false;
            //    }

            //    PnBook.Visible = true;
            //}

        private IEnumerable<Route> GetPossibleRoutes()
        {
            return pageData.Routes.Where(r => r.EndRegion.LoopedRegionId.ToString() == localData.Values.EndRegion);
        }

        private IEnumerable<AccessPoint> GetPossibleSAPs()
        {
            return GetPossibleRoutes().Where(r => r.StartRegion.LoopedRegionId.ToString() == localData.Values.StartRegion)
                                      .Select(r => r.StartRegion).Distinct().FirstOrDefault()?.AccessPoints;
        }

        private IEnumerable<AccessPoint> GetPossibleDAPs()
        {
            return GetPossibleRoutes().Where(r => r.EndRegion.LoopedRegionId.ToString() == localData.Values.EndRegion)
                                      .Select(r => r.EndRegion).Distinct().FirstOrDefault()?.AccessPoints;
        }

        private PageState GetInitialData()
        {
            var result = new PageState()
            {
                Values = new PageState.Selection()
                {
                    StartRegion = Guid.Empty.ToString(),
                    StartAP = Guid.Empty.ToString(),
                    EndRegion = Guid.Empty.ToString(),
                    EndAP = Guid.Empty.ToString(),
                    Seats = "1",
                    CalSelectedDate = DateTime.Today,
                    CalVisibleDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1),
                    Time = new TimeSpan(-1)
                }
            };

            return result;
        }

        private void InitializeControls()
        {
            DdlEndRegion.DataSource = DdlEndRegion_GetData();
            DdlEndRegion.ListDataBind();
            DdlSeats.DataSource = DdlSeats_GetData();
            DdlSeats.ListDataBind();
            DdlSeats.SelectedText = "1";
        }

        private void ProcessQueryString()
        {
            var query = Request.QueryString;

            if (query["Dest"] != null && query["Dest"] != string.Empty)
            {
                Guid? dest = pageData.Routes.Where(r => r.EndRegion.Name == query["Dest"]).Select(er => er.EndRegion).FirstOrDefault()?.LoopedRegionId;
                if (pageData.Routes.Where(r => r.EndRegion.LoopedRegionId == dest).Count() != 0)
                {
                    var endregion = pageData.Routes.Where(r => r.EndRegion.LoopedRegionId == dest).Select(er => er.EndRegion).FirstOrDefault().LoopedRegionId.ToString();
                    var endap = pageData.Routes.Where(r => r.EndRegion.LoopedRegionId == dest).FirstOrDefault()?.EndRegion?.AccessPoints?
                                                            .Where(ap => ap.Default)
                                                            .Select(ap => ap.AccessPointId).FirstOrDefault().ToString();
                    localData.Values.EndRegion = endregion;
                    DdlEndRegion.SelectedText = pageData.Routes.Where(r => r.EndRegion.LoopedRegionId == dest).Select(er => er.EndRegion).FirstOrDefault()?.Name;

                    localData.Values.EndAP = endap;
                    DdlEndAP.DataSource = DdlEndAP_GetData();
                    DdlEndAP.ListDataBind();
                    DdlEndAP.SelectedText = pageData.Routes.Where(r => r.EndRegion.LoopedRegionId == dest).FirstOrDefault()?.EndRegion?.AccessPoints?
                                                           .Where(ap => ap.Default)
                                                           .Select(ap => ap.Name).FirstOrDefault();

                    DdlStartRegion.DataSource = DdlStartRegion_GetData();
                    DdlStartRegion.ListDataBind();
                    localData.Values.StartRegion = Guid.Empty.ToString();
                    localData.Values.StartAP = Guid.Empty.ToString();
                    DdlStartRegion.SelectedText = "";
                    DdlStartAP.SelectedText = "";
                }
            }
        }

        //protected void CalDate_DayRender(object sender, DayRenderEventArgs e)
        //{
        //    var dayslot = pageData.DaySlots.Where(d => d.Day == e.Day.Date).FirstOrDefault();

        //    if (dayslot != null)
        //    {
        //        e.Day.IsSelectable = true;
        //        Label lb = new Label();
        //        lb.Text = " <br>" + dayslot.Price.ToString() + "€";
        //        switch (dayslot.Status)
        //        {
        //            case SlotStatus.RED:
        //                lb.ForeColor = System.Drawing.Color.Red;
        //                break;
        //            case SlotStatus.GREEN:
        //                lb.ForeColor = System.Drawing.Color.Green;
        //                break;
        //            case SlotStatus.YELLOW:
        //                lb.ForeColor = System.Drawing.Color.Yellow;
        //                break;
        //        }
        //        e.Cell.Controls.Add(lb);
        //    }
        //    else
        //    {
        //        e.Day.IsSelectable = false;
        //    }
        //}

        private void ClearSelection()
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
        }

        private void GetDebugData()
        {
            //LbDebug.Text = "localData.Values";
            //LbDebug.Text += "<br />StartRegion: " + localData.Values.StartRegion + " (CONTROL: " + DdlStartRegion.SelectedValue + ")";
            //LbDebug.Text += "<br />StartAP: " + localData.Values.StartAP + " (CONTROL: " + DdlStartAP.SelectedValue + ")";
            //LbDebug.Text += "<br />EndRegion: " + localData.Values.EndRegion + " (CONTROL: " + DdlEndRegion.SelectedValue + ")";
            //LbDebug.Text += "<br />EndAP: " + localData.Values.EndAP + " (CONTROL: " + DdlEndAP.SelectedValue + ")";
            //LbDebug.Text += "<br />Seats: " + localData.Values.Seats + " (CONTROL: " + DdlSeats.SelectedValue + ")";
            //LbDebug.Text += "<br />CalVisibleDate: " + localData.Values.CalVisibleDate + " (CONTROL: " + CalDate.VisibleDate + ")";
            //LbDebug.Text += "<br />CalSelectedDate: " + localData.Values.CalSelectedDate + " (CONTROL: " + CalDate.SelectedDate + ")";
            //LbDebug.Text += "<br />Time: " + localData.Values.Time;

            /*
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
            */
        }
    }
}
