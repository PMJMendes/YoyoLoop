using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Calendar
{
    public partial class CalendarTable : UserControl
    {
        public IEnumerable<DaySlot> DataSource
        {
            get
            {
                return WeekRepeater.DataSource as IEnumerable<DaySlot>;
            }

            set
            {
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
            control.IsOffMonth = !(slot.Day.Month == VisibleDate.Month && slot.Day.Year == VisibleDate.Year);
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
                    else
                    {
                        control.Flag = CalendarDay.DayFlag.None;
                    }
                    break;
            }
        }
    }
}
