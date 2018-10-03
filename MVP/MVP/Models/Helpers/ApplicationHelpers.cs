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

        public static CultureInfo DefaultCulture()
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("/");
            GlobalizationSection global = (GlobalizationSection)config.GetSection("system.web/globalization");
            CultureInfo result = CultureInfo.CreateSpecificCulture(global.Culture);

            return result;
        }

        public static void GTM_Login(Control control, string userid)
        {
            ScriptManager.RegisterStartupScript(control, control.GetType(), "GA-LoginKey", "GTM_Login('" + userid + "');", true);
        }

        public static void GTM_Signup(Control control, string id, string email, string name)
        {
            ScriptManager.RegisterStartupScript(control, control.GetType(), "GA-SignupKey", "GTM_Signup('" + id + "','" + email + "','" + name + "');", true);
        }

        public static void ClientRedirect(Control control, string url)
        {
            ScriptManager.RegisterStartupScript(control, control.GetType(), "redirectKey", "setTimeout(function(){$.blockUI();window.location.assign('" + url + "');},1);", true);
        }
    }
}