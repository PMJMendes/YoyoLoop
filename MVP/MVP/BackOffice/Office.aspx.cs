using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MVP.Services;
using MVP.Models;
using MVP.Models.Entities;

namespace MVP.BackOffice
{
    public partial class Office : System.Web.UI.Page
    {
        private readonly OfficeService service = new OfficeService();

        OfficeDTO pageData;

        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();

            // TEMP REDIRECT TO MAKE PAGE NON-BROWSABLE
            Response.Redirect("/");
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