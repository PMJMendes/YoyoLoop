using Microsoft.AspNet.Identity;
using MVP.Models.Extensions;
using MVP.Profile.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Profile
{
    public partial class Invite : System.Web.UI.Page
    {
        private readonly InviteService service = new InviteService();
        protected InviteDTO pageData;

        protected void Page_Init(object sender, EventArgs e)
        {
            // Load scripts
            ScriptManager mgr = ScriptManager.GetCurrent(this.Page);

            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("./Scripts/invite-popovers.js") });
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (User?.Identity.IsAuthenticated == false)
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
                pageData = (InviteDTO)Session["invite.data"];
            }

            if (pageData == null)
            {
                pageData = service.GetInitialData(User?.Identity.GetUserId());
                Session["invite.data"] = pageData;
            }
        }

        protected void btnCopyLink_Click(object sender, EventArgs e)
        {
            phCopyLink.Visible = false;
            phLinkCopied.Visible = true;
        }

        protected void btnShare_Click(object sender, EventArgs e)
        {
            phSharePopover.Visible = true;
        }
    }
}