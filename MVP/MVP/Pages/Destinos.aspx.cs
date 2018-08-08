using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Pages
{
    public partial class Destinos : System.Web.UI.Page
    {
        public class PageState
        {
            public string Destino;
        }

        protected PageState localData;

        protected void Page_Load(object sender, EventArgs e)
        {
            localData = null;

            if (IsPostBack)
            {
                localData = (PageState)Session["destinos.data"];
            }

            if (localData == null)
            {
                localData = new PageState();
                var query = Request.QueryString;

                if (!string.IsNullOrEmpty(query["Destino"]))
                {
                    switch(query["Destino"])
                    {
                        case "Lisboa":
                            localData.Destino = "lisboa";
                            break;
                        case "Porto":
                            localData.Destino = "porto";
                            break;
                        case "Cascais":
                            localData.Destino = "cascais";
                            break;
                        case "Coimbra":
                            localData.Destino = "coimbra";
                            break;
                        default:
                            localData.Destino = string.Empty;
                            break;
                    }
                }
                Session["destinos.data"] = localData;
            }
        }
    }
}