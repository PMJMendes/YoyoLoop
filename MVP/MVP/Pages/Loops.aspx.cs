using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Pages
{
    public partial class Loops : System.Web.UI.Page
    {
        public class PageState
        {
            public string Loop;
        }

        protected PageState localData;

        protected void Page_Load(object sender, EventArgs e)
        {
            localData = null;

            if (IsPostBack)
            {
                localData = (PageState)Session["loops.data"];
            }

            if (localData == null)
            {
                localData = new PageState();
                var query = Request.QueryString;

                if (!string.IsNullOrEmpty(query["Loop"]))
                {
                    switch (query["Loop"])
                    {
                        case "Lisboa-Leiria":
                            localData.Loop = "lisboa-leiria";
                            break;
                        case "Lisboa-Coimbra":
                            localData.Loop = "lisboa-coimbra";
                            break;
                        case "Lisboa-Porto":
                            localData.Loop = "lisboa-porto";
                            break;
                        default:
                            localData.Loop = string.Empty;
                            break;
                    }
                }
                Session["loops.data"] = localData;
            }
        }
    }
}