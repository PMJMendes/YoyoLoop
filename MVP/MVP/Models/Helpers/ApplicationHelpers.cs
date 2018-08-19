using MVP.Controls;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;

namespace MVP.Models.Helpers
{
    public class ApplicationHelpers
    {
        public static void ShowMessage(Page page, string message)
        {
            var messageBox = (Message)page.Master.FindControl("message");
            messageBox.MessageText = message;
            var panel = (UpdatePanel)messageBox.FindControl("upMessage");
            panel.Update();
            ScriptManager.RegisterStartupScript(page, page.GetType(), "showMessageModalKey", "showMessage();", true);
        }

        public static CultureInfo DefaultUICulture()
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("/");
            GlobalizationSection global = (GlobalizationSection)config.GetSection("system.web/globalization");
            CultureInfo result = CultureInfo.CreateSpecificCulture(global.UICulture);

            return result;
        }

    }
}