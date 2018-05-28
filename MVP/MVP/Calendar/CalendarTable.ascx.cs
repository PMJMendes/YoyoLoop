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
            control.IsOffMonth = !(slot.Day.Month == DateTime.Today.Month && slot.Day.Year == DateTime.Today.Year);
            control.DayText = slot.Day.Day.ToString();
            control.PriceText = slot.Price.ToString() + "€";

            switch(slot.Status)
            {
                case SlotStatus.YELLOW:
                    control.PriceText = "Quase cheio";
                    control.Flag = CalendarDay.DayFlag.Limited;
                    break;
                case SlotStatus.RED:
                    control.PriceText = "Esgotado";
                    control.Flag = CalendarDay.DayFlag.Unavailable;
                    break;
                default:
                    control.PriceText = "";
                    control.Flag = CalendarDay.DayFlag.None;
                    break;
            }
        }
    }
}
