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
            var slot = (APGroup)e.Item.DataItem;

            var control = (PopoverAPGroup)e.Item.FindControl("PopoverAPGroup");

            control.Trip = slot.StartAPName + "<br/>&rarr; " + slot.EndAPName;
        }
    }
}