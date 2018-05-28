using MVP.Calendar;
using MVP.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<ListItem> x = new List<ListItem>() { new ListItem("A", "1"), new ListItem("B", "2"), new ListItem("C", "3") };
                DropdownMenuButton1.DataSource = x;
                DropdownMenuButton1.ListDataBind();

                List<ListItem> y = new List<ListItem>() { new ListItem("A", "1"), new ListItem("B", "2"), new ListItem("C", "3") };
                DropdownMenuButton2.DataSource = y;
                DropdownMenuButton2.ListDataBind();

                List<DaySlot> z = new List<DaySlot>()
                {
                    new DaySlot { Day = new DateTime(2018, 2, 26), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 2, 27), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 2, 28), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 1), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 2), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 3), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 4), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 5), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 6), Status = SlotStatus.GREEN, Price = 25 },
                    new DaySlot { Day = new DateTime(2018, 3, 7), Status = SlotStatus.GREEN, Price = 25 },
                    new DaySlot { Day = new DateTime(2018, 3, 8), Status = SlotStatus.RED, Price = 25 },
                    new DaySlot { Day = new DateTime(2018, 3, 9), Status = SlotStatus.YELLOW, Price = 25 },
                    new DaySlot { Day = new DateTime(2018, 3, 10), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 11), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 12), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 13), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 14), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 15), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 16), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 17), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 18), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 19), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 20), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 21), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 22), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 23), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 24), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 25), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 26), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 27), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 28), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 29), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 30), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 3, 31), Status = SlotStatus.GREEN, Price = 5 },
                    new DaySlot { Day = new DateTime(2018, 4, 1), Status = SlotStatus.GREEN, Price = 5 },
                };
                CalendarTable.DataSource = z;
                CalendarTable.DataBind();
            }
        }

        protected void DropdownMenuButton1_ItemSelected(object sender, DropdownMenuButton.ItemSelectedEventArgs e)
        {

        }

        protected void DropdownMenuButton2_ItemSelected(object sender, DropdownMenuButton.ItemSelectedEventArgs e)
        {

        }
    }
}