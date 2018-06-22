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
        public class TimeSelectedEventArgs : EventArgs
        {
            public TimeSpan TimeSelected;
            public string Group;
        }

        public event EventHandler<TimeSelectedEventArgs> TimeSelected;

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
                var grouprepeater = (RepeaterItem)((RepeaterItem)((Repeater)sender).Parent).Parent.NamingContainer;
                var startlabel = (Label)grouprepeater.FindControl("StartAP");
                var endlabel = (Label)grouprepeater.FindControl("EndAP");
                string apgroup = startlabel.Text + "," + endlabel.Text;
                control.Text = timeslot.Departure.Time.ToString("hh\\:mm");
                control.CommandArgument = apgroup;
                switch (timeslot.Status) // Colors to be replaced by styles
                {
                    case SlotStatus.GREEN:
                        control.BackColor = System.Drawing.Color.FromArgb(46, 204, 113);
                        control.ForeColor = System.Drawing.Color.White;
                        break;
                    case SlotStatus.YELLOW:
                        control.BackColor = System.Drawing.Color.FromArgb(243, 156, 18);
                        control.ForeColor = System.Drawing.Color.White;
                        break;
                    case SlotStatus.RED:
                        control.BackColor = System.Drawing.Color.FromArgb(255, 95, 109);
                        control.ForeColor = System.Drawing.Color.White;
                        break;
                    case SlotStatus.BLACK:
                        control.BackColor = System.Drawing.Color.LightGray;
                        control.ForeColor = System.Drawing.Color.DarkGray;
                        control.Enabled = false;
                        break;
                    case SlotStatus.NONE:
                        control.BackColor = System.Drawing.Color.LightGray;
                        control.ForeColor = System.Drawing.Color.DarkGray;
                        control.Enabled = false;
                        break;
                    default:
                        control.Visible = false;
                        control.Enabled = false;
                        break;
                }

            }
        }

        protected void TimeRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            LinkButton button = (LinkButton)e.CommandSource;
            OnTimeSelected(TimeSpan.Parse(button.Text), (string)e.CommandArgument);
        }

        protected void OnTimeSelected(TimeSpan time, string group)
        {
            TimeSelected?.Invoke(this, new TimeSelectedEventArgs() { TimeSelected = time, Group = group });
        }
    }
}