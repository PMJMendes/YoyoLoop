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
            ApplicationHelpers.ShowMessage(this, "The quick brown fox jumps over the lazy dog The quick brown fox jumps over the lazy dog The quick brown fox jumps over the lazy dog The quick brown fox jumps over the lazy dog.");
        }

        protected void btnSMS_Click(object sender, EventArgs e)
        {

        }
    }
}