using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Calendar
{
    public partial class Popover : UserControl
    {
        public IEnumerable<APGroup> DataSource
        {
            get
            {
                return APGroupRepeater.DataSource as IEnumerable<APGroup>;
            }

            set
            {
                APGroupRepeater.DataSource = value;
            }
        }

        protected void APGroupRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.DataItem != null)
            {
                var slot = (APGroup)e.Item.DataItem;
                var startlabel = (Label)e.Item.FindControl("StartAP");
                var endlabel = (Label)e.Item.FindControl("EndAP");
                var control = (Repeater)e.Item.FindControl("RowRepeater");
                startlabel.Text = slot.StartAPName;
                endlabel.Text = slot.EndAPName; 
                control.DataSource = slot.Times.Select((x, i) => new { Index = i, Value = x })
                                               .GroupBy(x => x.Index / 2)
                                               .Select(x => x.Select(v => v.Value).ToList())
                                               .ToList();
                control.DataBind();
            }
        }

        protected void RowRepeater_ItemDatabound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.DataItem != null)
            {
                var list = (IEnumerable<TimeSlot>)e.Item.DataItem;
                var control = (Repeater)e.Item.FindControl("TimeRepeater");
                control.DataSource = list;
                control.DataBind();
            }
        }

        protected void TimeRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.DataItem != null)
            {
                var timeslot = (TimeSlot)e.Item.DataItem;
                var control = (LinkButton)e.Item.FindControl("BtnTime");
                control.Text = timeslot.Time.ToString("hh\\:mm");
            }
        }
    }
}