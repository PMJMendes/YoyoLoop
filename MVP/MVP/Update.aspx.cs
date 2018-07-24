using System;
using System.Web.Configuration;
using MVP.Services;
namespace MVP
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.UserHostAddress != WebConfigurationManager.AppSettings["UpdateTaskServer"])
            {
                var service = new MasterService();
                service.MasterUpdate();
            }
        }
    }
}