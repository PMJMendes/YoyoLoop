using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Controls
{
    public partial class Message : System.Web.UI.UserControl
    {
        public string MessageText
        {
            get
            {
                return (string)ViewState["MessageText"];
            }
            set
            {
                ViewState["MessageText"] = value;
            }
        }
    }
}