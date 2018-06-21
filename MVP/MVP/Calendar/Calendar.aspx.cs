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
        public PageState localData;

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
            if (DdlStartRegion.DataSource.Count() == 1)
            {
                var item = DdlStartRegion.DataSource.First();
                DdlStartRegion.SelectedText = item.Text;
                DdlStartRegion_ItemSelected(this.FindControl("DdlStartRegion"), new DropdownMenuButton.ItemSelectedEventArgs() { Item = item.Value });
            }
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

        protected void DdlSeats_ItemSelected(object sender, DropdownFixed.ItemSelectedEventArgs e)
        {
            string s = e.Item.ToString();
            localData.Values.Seats = s;
            DdlSeats.SelectedText = s + (s == "1" ? " lugar" : " lugares");

            CheckParams();
        }

        protected void CalDate_DaySelected(object sender, CalendarTable.DaySelectedEventArgs e)
        {
            localData.Values.CalSelectedDate = e.DaySelected;
            CheckParams();
            
            if(e.DaySelected.Date < DateTime.Today || e.PriceText == "")
            {
                return;
            }

            var timeslots = service.GetTimeSlots(pageData);
            if(!timeslots.Any())
            {
                return;
            }

            CalDate.ShowPopover(timeslots);
        }

        protected void CalDate_TimeSelected(object sender, Popover.TimeSelectedEventArgs e)
        {
            localData.Values.Time = e.TimeSelected;
            CheckParams();
            Char delimiter = ',';
            string[] apgroup = e.Group.Split(delimiter);
            string startapname = apgroup[0];
            string endapname = apgroup[1];
            UpdateBookingPanel(startapname, endapname);
        }

        protected void CalBtnMonthControl(object sender, ImageClickEventArgs e)
        {
            ImageButton button = (ImageButton)sender;
            switch (button.ID)
            {
                case "BtnMonthBack":
                    localData.Values.CalVisibleDate = 
                    CalDate.VisibleDate = localData.Values.CalVisibleDate.AddMonths(-1);
                    break;
                case "BtnMonthFwd":
                    localData.Values.CalVisibleDate =
                    CalDate.VisibleDate = localData.Values.CalVisibleDate.AddMonths(1);
                    break;
            }
            GetCalendarData();
        }

        protected void CalBtnMonthToday(object sender, EventArgs e)
        {
            DateTime today = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
            if (localData.Values.CalVisibleDate == today)
            {
                return;
            }
            else
            {
                localData.Values.CalVisibleDate =
                CalDate.VisibleDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
                GetCalendarData();
            }
        }

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

        public IEnumerable<string> DdlSeats_GetData()
        {
            return new List<string>  { "1",
                                       "2",
                                       "3",
                                       "4",
                                       "5",
                                       "6",
                                       "7",};
        }

        private void GetCalendarData()
        {
            DateTime d = localData.Values.CalVisibleDate;
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

            if(pageData.Selection.Route == null)
            {
                List<DaySlot> days = new List<DaySlot>();
                var date = firstdate;

                while (date <= lastdate)
                {
                    days.Add(new DaySlot { Day = date, Status = SlotStatus.NONE, Price = 0 });
                    date = date + TimeSpan.FromDays(1);
                }

                CalDate.DataSource = days;
                CalDate.DataBind();
            }
            else
            {
                pageData.DaySlots = service.GetDaySlots(pageData, firstdate, lastdate);
                CalDate.DataSource = pageData.DaySlots;
                CalDate.DataBind();
            }

            return;
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
        }


        private void CheckParams()
        {
            var route = GetPossibleRoutes().Where(r => r.StartRegion.LoopedRegionId.ToString() == localData.Values.StartRegion).FirstOrDefault();
            var sap = GetPossibleSAPs()?.Where(ap => ap.AccessPointId.ToString() == localData.Values.StartAP)?.FirstOrDefault();
            var dap = GetPossibleDAPs()?.Where(ap => ap.AccessPointId.ToString() == localData.Values.EndAP)?.FirstOrDefault();
            bool calupdate = false;

            if (route == null)
            {
                ClearSelection();
                localData.Values.CalSelectedDate = DateTime.MinValue;
                pnCalendar.Visible = false;
                BookingPanel.Init_Data();
                BookingPanel.Visible = false;
            }
            else
            {
                if (pageData.Selection.Route != route)  // New Route
                {
                    pageData.Selection.Route = route;
                    pageData.Selection.Date =
                    localData.Values.CalSelectedDate = DateTime.MinValue;

                    calupdate = true;
                }

                if (pageData.Selection.SAP != sap) // New SAP
                {
                    pageData.Selection.SAP = sap;
                    calupdate = true; // we need to redraw calendar cause daystatus may have changed; this may no longer be true
                }

                if (pageData.Selection.DAP != dap) // New DAP
                {
                    pageData.Selection.DAP = dap;
                    calupdate = true; // we need to redraw calendar cause daystatus may have changed; this may no longer be true
                }

                if (pageData.Selection.Date != localData.Values.CalSelectedDate) // New date
                {
                    pageData.Selection.Date = localData.Values.CalSelectedDate;
                    pageData.Selection.Price = pageData.DaySlots.Where(d => d.Day == pageData.Selection.Date).Select(p => p.Price).First();
                }

                if (pageData.Selection.Seats.ToString() != localData.Values.Seats) // New seats
                {
                    pageData.Selection.Seats = int.Parse(localData.Values.Seats);
                    calupdate = true; // we need to redraw calendar cause daystatus may have changed
                }

                if (pageData.Selection.Time != localData.Values.Time) // New time
                {
                    pageData.Selection.Time = localData.Values.Time;
                }
            }

            if (calupdate)
            {
                GetCalendarData();
                pnCalendar.Visible = true;
            }
        }

        private void UpdateBookingPanel(string startapname, string endapname)
        {
            BookingPanel.PanelData.Seats = pageData.Selection.Seats;
            BookingPanel.PanelData.Cost = pageData.Selection.Price * pageData.Selection.Seats;
            BookingPanel.PanelData.StartTime = pageData.Selection.Date + pageData.Selection.Time;
            BookingPanel.PanelData.StartRegionName = pageData.Selection.Route.StartRegion.Name;
            BookingPanel.PanelData.EndRegionName = pageData.Selection.Route.EndRegion.Name;
            BookingPanel.PanelData.StartAPName = startapname;
            BookingPanel.PanelData.EndAPName = endapname;

            BookingPanel.Visible = true;
        }

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
            if (DdlEndRegion.DataSource.Count() == 1)
            {
                DdlEndRegion_ItemSelected(this, new DropdownMenuButton.ItemSelectedEventArgs() { Item = DdlEndRegion.DataSource.First() });
            }
            DdlSeats.DataSource = DdlSeats_GetData();
            DdlSeats.ListDataBind();
            DdlSeats.SelectedText = "1 lugar";
            localData.Values.Seats = "1";
            CalDate.VisibleDate = localData.Values.CalVisibleDate;
            CalDate.SelectedDate = new DateTime();
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
                    CheckParams();
                    if (DdlStartRegion.DataSource.Count() == 1)
                    {
                        var item = DdlStartRegion.DataSource.First();
                        DdlStartRegion.SelectedText = item.Text;
                        DdlStartRegion_ItemSelected(this.FindControl("DdlStartRegion"), new DropdownMenuButton.ItemSelectedEventArgs() { Item = item.Value });
                    }
                }
            }
        }

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
    }
}
