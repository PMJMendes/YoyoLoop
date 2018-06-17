using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Calendar
{
    public partial class CalendarTable : UserControl
    {
        public class DaySelectedEventArgs : EventArgs
        {
            public DateTime DaySelected;
        }

        public event EventHandler<DaySelectedEventArgs> DaySelected;

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

        public string SelectedDayID
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
            SelectedDayID = control.ClientID;
            this.DataSource = this.DataSource;
            WeekRepeater.DataBind();
            OnDaySelected(new DaySelectedEventArgs { DaySelected = control.Date });
        }

        public void ShowPopover(IEnumerable<APGroup> popoverData)
        {
            var control = (CalendarDay)FindControlRecursive(this, SelectedDayID);
            Popover.DataSource = popoverData;
            Popover.DataBind();
            string target = "#" + control.FindControl("DayWrapper").ClientID;
            Page.ClientScript.RegisterStartupScript(GetType(), "showPopoverKey", "showPopover('" + target + "');", true);
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

        private Control FindControlRecursive(Control ctrl, string id)
        {
            if (ctrl.ClientID == id)
            {
                return ctrl;
            }
            foreach (Control child in ctrl.Controls)
            {
                Control t = FindControlRecursive(child, id);
                if (t != null)
                {
                    return t;
                }
            }
            return null;
        }
    }
}
