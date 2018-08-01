using MVP.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
    }
}