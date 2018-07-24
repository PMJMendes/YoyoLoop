using System;
using MVP.Services;
namespace MVP
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            var service = new MasterService();
            if (Request.IsLocal)
            {
                service.MasterUpdate();
            }

            service.SendWarning("Hostname: " + Request.UserHostName + "\r\nIPAddress: " + Request.UserHostAddress);
        }
    }
}