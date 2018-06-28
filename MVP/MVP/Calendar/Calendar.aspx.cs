using MVP.Services;
using MVP.Controls;
using MVP.Models;
using MVP.Models.Entities;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Web;

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
                public Guid DepartureId { get; set; }
            }
        }

        private readonly CalendarService service = new CalendarService();

        CalendarDTO pageData;
        public PageState localData;

        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
            service.CheckPending();
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
            var timeparams = e.TimeParams.Split('|');
            string startapname = timeparams[0];
            string endapname = timeparams[1];
            localData.Values.DepartureId = Guid.Parse(timeparams[2]);

            if (startapname != pageData.Selection.SAP.Name)
            {
                localData.Values.StartAP = pageData.Selection.Route.StartRegion.AccessPoints.Single(ap => ap.Name == startapname).AccessPointId.ToString();
                DdlStartAP.SelectedText = startapname;
            }

            if (endapname != pageData.Selection.DAP.Name)
            {
                localData.Values.EndAP = pageData.Selection.Route.EndRegion.AccessPoints.Single(ap => ap.Name == endapname).AccessPointId.ToString();
                DdlEndAP.SelectedText = endapname;
            }

            CheckParams();
            ClearBookingPanel();
            UpdateBookingPanel("new");
        }

        protected void BookingPanel_PromoEntered(object sender, BookingPanel.PromoEnteredEventArgs e)
        {
            pageData.Selection.Price = service.CheckPromo(pageData, e.Promocode);
            UpdateBookingPanel("promo");
        }

        protected void BookingPanel_BookingSelected(object sender, BookingPanel.BookingSelectedEventArgs e)
        {
            if(User?.Identity.IsAuthenticated == true)
            {
                var booking = service.CreateBooking(pageData);
                if(booking == null)
                {
                    //NEED PRETTY ERROR HANDLING HERE
                    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Trip no longer available.\")</SCRIPT>");
                    //Response.Redirect("/Calendar/Calendar");
                }
                else
                {
                    Response.Redirect("/Checkout/Checkout?Id=" + Guid.Parse(booking.BookingId.ToString()));
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "showRegistarModalKey", "$('#registerModal').modal('show');", true);
            }
        }

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

            pageData.DaySlots = service.GetDaySlots(pageData, firstdate, lastdate);
            CalDate.DataSource = pageData.DaySlots;
            CalDate.DataBind();

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
            string bookupdate = string.Empty;

            if (route == null)
            {
                ClearSelection();
                localData.Values.CalSelectedDate = DateTime.MinValue;
                bookupdate = "clear";
                pnCalendar.Visible = false;
            }
            else
            {
                if (pageData.Selection.Route != route)  // New Route
                {
                    pageData.Selection.Route = route;
                    pageData.Selection.Date =
                    localData.Values.CalSelectedDate = DateTime.MinValue;
                    bookupdate = "clear";
                    calupdate = true;
                }

                if (pageData.Selection.SAP != sap) // New SAP
                {
                    pageData.Selection.SAP = sap;
                    bookupdate = "sap";
                    calupdate = true; // we need to redraw calendar cause daystatus may have changed; this may no longer be true
                }

                if (pageData.Selection.DAP != dap) // New DAP
                {
                    pageData.Selection.DAP = dap;
                    bookupdate = "dap";
                    calupdate = true; // we need to redraw calendar cause daystatus may have changed; this may no longer be true
                }

                if (pageData.Selection.Date != localData.Values.CalSelectedDate) // New date
                {
                    pageData.Selection.Date = localData.Values.CalSelectedDate;
                    pageData.Selection.FullPrice = 
                    pageData.Selection.Price = pageData.DaySlots.Where(d => d.Day == pageData.Selection.Date).Select(p => p.Price).First();
                    bookupdate = "date";
                }

                if (pageData.Selection.Seats.ToString() != localData.Values.Seats) // New seats
                {
                    pageData.Selection.Seats = int.Parse(localData.Values.Seats);
                    bookupdate = "seats";
                    calupdate = true; // we need to redraw calendar cause daystatus may have changed
                }

                if (pageData.Selection.Time != localData.Values.Time) // New time
                {
                    pageData.Selection.Time = localData.Values.Time;
                    pageData.Selection.DepartureId = localData.Values.DepartureId;
                }
            }

            if(bookupdate != string.Empty)
            {
                if (bookupdate == "clear")
                {
                    ClearBookingPanel();
                }
                else if (BookingPanel.Visible)
                {
                    UpdateBookingPanel(bookupdate);
                }

            }
            if (calupdate)
            {
                GetCalendarData();
                pnCalendar.Visible = true;
            }
        }

        private void ClearBookingPanel()
        {
            BookingPanel.Init_Data();
            BookingPanel.Visible = false;
        }

        private void UpdateBookingPanel(string trigger)
        {
            switch(trigger)
            {
                case "new":
                    BookingPanel.Databind(pageData.Selection, trigger, true);
                    break;
                default:
                    BookingPanel.Databind(pageData.Selection, trigger, service.CheckPossible(pageData));
                    break;
            }
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
                FullPrice = 0,
                Price = 0,
                Seats = 1,
                DepartureId = Guid.Empty
            };
            pageData.DaySlots.Clear();
        }
    }
}
