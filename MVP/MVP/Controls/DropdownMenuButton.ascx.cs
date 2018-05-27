using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Controls
{
    public partial class DropdownMenuButton : UserControl
    {
        public class ItemSelectedEventArgs : EventArgs
        {
            public object Item { get; set; }
        }

        public string SelectedText
        {
            get; set;
        }

        public string SelectionPrompt
        {
            get; set;
        }

        public object DataSource
        {
            get
            {
                return ItemRepeater.DataSource;
            }

            set
            {
                ItemRepeater.DataSource = value;
            }
        }

        public event EventHandler<ItemSelectedEventArgs> ItemSelected;

        public void ListDataBind()
        {
            ItemRepeater.DataBind();
        }

        protected void ItemRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            OnItemSelected(e.CommandArgument);
            this.SelectedText = e.CommandName; // This doesn't work
        }

        protected void OnItemSelected(object item)
        {
            ItemSelected?.Invoke(this, new ItemSelectedEventArgs() { Item = item });
        }
    }
}