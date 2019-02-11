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
            public ListItem Item { get; set; }
        }

        protected string SelectedText
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

        protected string SelectionPrompt
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

        protected IEnumerable<ListItem> DataSource
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

        public Func<IEnumerable<ListItem>> DataSourceGetter;


        protected void ListDataBind()
        {
            ItemRepeater.DataBind();
        }

        protected void ItemRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var selectedItem = new ListItem(e.CommandName, (string)e.CommandArgument);
            this.SelectedText = selectedItem.Text;
            OnItemSelected(selectedItem);
        }

        protected void OnItemSelected(ListItem item)
        {
            ItemSelected?.Invoke(this, new ItemSelectedEventArgs() { Item = item });
        }

        public void LoadDataSource()
        {
            this.DataSource = DataSourceGetter();
            this.ListDataBind();
        }

        public ListItem SelectFirst()
        {
            // ensure data source is up to date
            LoadDataSource();
            // then select first, if any
            if (this.DataSource.Count() > 0)
            {
                var item = this.DataSource.First();
                this.SelectedText = item.Text;
                OnItemSelected(item);
                return item;
            } else
            {
                this.SelectedText = "";
                ItemSelected?.Invoke(this, new ItemSelectedEventArgs() { Item = new ListItem("","") });
            }
            return null;
        }

        public ListItem SelectByValue(String value)
        {
            // ensure data source is up to date
            LoadDataSource();
            // then select item by value
            ListItem item = this.DataSource.Where(i => i.Value == value).Single();
            this.SelectedText = item.Text;
            this.OnItemSelected(item);
            return item;
        }


    }
}