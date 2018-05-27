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
            get
            {
                return (string)ViewState["SelectedText"];
            }
            
            set
            {
                ViewState["SelectedText"] = value;
            }
        }

        public string SelectionPrompt
        {
            get
            {
                return (string)ViewState["SelectionPrompt"];
            }
            
            set
            {
                ViewState["SelectionPrompt"] = value;
            }
        }

        public IEnumerable<ListItem> DataSource
        {
            get
            {
                return ItemRepeater.DataSource as IEnumerable<ListItem>;
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
            var data = (string)e.CommandArgument;
            this.SelectedText = this.DataSource.Where(i => i.Value == data).FirstOrDefault().Text;
            OnItemSelected(data);
        }

        protected void OnItemSelected(object item)
        {
            ItemSelected?.Invoke(this, new ItemSelectedEventArgs() { Item = item });
        }
    }
}