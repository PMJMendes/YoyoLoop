using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Controls
{
    public partial class DropdownFixed : UserControl
    {
        public class ItemSelectedEventArgs : EventArgs
        {
            public object Item { get; set; }
        }

        public string SelectedText
        {
            get
            {
                return (string)ViewState["SelectedText"];
            }

            set
            {
                ViewState["SelectedText"] = value;
            }
        }

        public IEnumerable<string> DataSource
        {
            get
            {
                return ItemRepeater.DataSource as IEnumerable<string>;
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
            this.SelectedText = (string)e.CommandArgument;
            OnItemSelected((string)e.CommandArgument);
        }

        protected void OnItemSelected(object item)
        {
            ItemSelected?.Invoke(this, new ItemSelectedEventArgs() { Item = item });
        }
    }
}