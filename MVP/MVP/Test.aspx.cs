using MVP.Controls;
using MVP.Models.Helpers;
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
        protected void btnEmail_Click(object sender, EventArgs e)
        {
            ApplicationHelpers.ShowMessage(this, "Your email has been sent.");
        }

        protected void btnSMS_Click(object sender, EventArgs e)
        {

        }
    }
}