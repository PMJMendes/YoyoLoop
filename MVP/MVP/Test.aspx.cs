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