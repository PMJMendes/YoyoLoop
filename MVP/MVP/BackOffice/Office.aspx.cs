using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MVP.Services;
using MVP.Models;
using MVP.Models.Entities;
using MVP.Models.Extensions;

namespace MVP.BackOffice
{
    public partial class Office : System.Web.UI.Page
    {
        private readonly OfficeService service = new OfficeService();

        OfficeDTO pageData;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (User?.Identity.IsAdmin() == false)
            {
                Response.Redirect("/");
            }

            InitData();
        }

        private void InitData()
        {
            pageData = null;
            if (IsPostBack)
            {
                pageData = (OfficeDTO)Session["office.data"];
            }

            if (pageData == null)
            {
                pageData = service.GetInitialData();
                Session["office.data"] = pageData;
            }
        }
    }
}