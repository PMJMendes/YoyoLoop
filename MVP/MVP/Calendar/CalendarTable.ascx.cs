using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Calendar
{
    public partial class CalendarTable : UserControl
    {
        public class DaySelectedEventArgs : EventArgs
        {
            public DateTime DaySelected;
            public string PriceText;
        }

        public event EventHandler<DaySelectedEventArgs> DaySelected;

        [System.ComponentModel.Bindable(true)]
        public string PopoverWrapper { get; set; }

        public IEnumerable<DaySlot> DataSource
        {
            get
            {
                return (IEnumerable<DaySlot>)ViewState["DataSource"];
            }

            set
            {
                ViewState["DataSource"] = value;
                WeekRepeater.DataSource = value.GroupBy(s => (int)(s.Day - value.First().Day).TotalDays / 7);
            }
        }

        public DateTime VisibleDate
        {
            get
            {
                return (DateTime)ViewState["VisibleDate"];
            }
                
            set
            {
                ViewState["VisibleDate"] = value;
            }
        }

        public DateTime SelectedDate
        {
            get
            {
                return (DateTime)ViewState["SelectedDate"];
            }

            set
            {
                ViewState["SelectedDate"] = value;
            }
        }

        public string SelectedDayWrapperID
        {
            get
            {
                return (string)ViewState["SelectedDayID"];
            }

            set
            {
                ViewState["SelectedDayID"] = value;
            }
        }

        protected void CalendarDay_DayClicked(object sender, EventArgs e)
        {
            var control = (CalendarDay)sender;
            SelectedDate = control.Date;
            SelectedDayWrapperID = control.FindControl("DayWrapper").ClientID;
            this.DataSource = this.DataSource;
            WeekRepeater.DataBind();
            OnDaySelected(new DaySelectedEventArgs { DaySelected = control.Date,
                                                     PriceText = control.PriceText
                                                    });
        }

        public void ShowPopover(IEnumerable<APGroup> popoverData)
        {
            Popover.DataSource = popoverData;
            Popover.DataBind();
            string source = "#" + PopoverWrapper;
            string target = "#" + SelectedDayWrapperID;
            Page.ClientScript.RegisterStartupScript(GetType(), "show" + PopoverWrapper + "Key", "showPopover('" + source + "', '" + target + "');", true);
        }

        protected void WeekRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var list = (IEnumerable<DaySlot>)e.Item.DataItem;

            var control = (Repeater)e.Item.FindControl("DayRepeater");

            control.DataSource = list;
            control.DataBind();
        }

        protected void DayRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var slot = (DaySlot)e.Item.DataItem;

            var control = (CalendarDay)e.Item.FindControl("CalendarDay");

            control.IsCurrent = slot.Day == DateTime.Today;
            control.Date = slot.Day;
            control.DayText = slot.Day.Day.ToString();
            if(slot.Price == 0)
            {
                control.PriceText = "";
            }
            else
            {
                control.PriceText = slot.Price.ToString() + "€";
            }

            switch (slot.Status)
            {
                case SlotStatus.GREEN:
                    control.InfoText = "";
                    control.Flag = CalendarDay.DayFlag.Fully;
                    break;
                case SlotStatus.YELLOW:
                    control.InfoText = "";
                    control.Flag = CalendarDay.DayFlag.Available;
                    break;
                case SlotStatus.RED:
                    control.InfoText = "Quase cheio";
                    control.Flag = CalendarDay.DayFlag.Limited;
                    break;
                case SlotStatus.BLACK:
                    control.InfoText = "Esgotado";
                    control.Flag = CalendarDay.DayFlag.Unavailable;
                    break;
                default:
                    control.InfoText = "";
                    control.PriceText = "";
                    if(slot.Day.DayOfWeek == DayOfWeek.Saturday || slot.Day.DayOfWeek == DayOfWeek.Sunday)
                    {
                        control.Flag = CalendarDay.DayFlag.Weekend;
                    }
                    else if (!(slot.Day.Month == VisibleDate.Month && slot.Day.Year == VisibleDate.Year))
                    {
                        control.Flag = CalendarDay.DayFlag.OffMonth;
                    }
                    else
                    {
                        control.Flag = CalendarDay.DayFlag.None;
                    }
                    break;
            }

            if(slot.Day == SelectedDate)
            {
                control.Flag = CalendarDay.DayFlag.Selected;
            }
        }

        protected virtual void OnDaySelected(DaySelectedEventArgs args)
        {
            DaySelected?.Invoke(this, args);
        }
    }
}
