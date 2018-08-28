using System;
using System.Web;
using MVP.Services;
using Microsoft.AspNet.Identity;
using System.Web.UI;
using Microsoft.AspNet.Identity.Owin;
using MVP.Models.Helpers;

namespace MVP.Confirm
{
    public partial class Confirm : System.Web.UI.Page
    {
        private readonly ConfirmService service = new ConfirmService();
        protected ConfirmDTO pageData;

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
                pageData = (ConfirmDTO)Session["confirm.data"];
            }

            if (pageData == null)
            {
                pageData = service.GetInitialData();
                ProcessQueryString();
                Session["confirm.data"] = pageData;
            }
        }

        private void ProcessQueryString()
        {
            var query = Request.QueryString;
            Guid id;

            if (Guid.TryParse(query["Id"], out id))
            {
                pageData = service.GetBooking(id);
                if (pageData == null)
                {
                    // temp blank values to stop page from crashing - eventually not needed when redirect is uncommented
                    pageData = new ConfirmDTO
                    {
                        BookingId = Guid.Empty,
                        UserId = "",
                        UserEmail = "email@email.com",
                        UserEmailConfirmed = false,
                        Seats = 0,
                        Cost = 0,
                        TicketCode = "#MYTICKETYO",
                        TicketURL = "#",
                        StartTime = DateTime.Now,
                        StartRegionName = "Start Region",
                        StartAPName = "Start AP",
                        EndRegionName = "End Region",
                        EndAPName = "End AP",
                        InviteURL = "#"
                    };
                    Response.Redirect("/");
                }
                else if (pageData.UserId != User?.Identity.GetUserId())
                {
                    Response.Redirect("/");
                }
                var scheme = Request.Url.Scheme;
                var authority = Request.Url.Authority;
                pageData.TicketURL = scheme + "://" + authority + "/Ticket/Ticket?Id=" + pageData.BookingId.ToString();
                pageData.InviteURL = scheme + "://" + authority + "/Profile/Invite";
                if(!pageData.UserEmailConfirmed)
                {
                    var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                    var userid = User.Identity.GetUserId();
                    string code = manager.GenerateEmailConfirmationToken(userid);
                    string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, userid, Request);
                    callbackUrl += "&bookid=" + pageData.BookingId;
                    service.SendUnconfirmedTicket(pageData, callbackUrl);
                }
            }
            else
            {
                Response.Redirect("/");
            }
        }

        protected void btnEmail_Click(object sender, EventArgs e)
        {
            service.SendTicket(pageData);
            ApplicationHelpers.ShowMessage(this, Resources.LocalizedText.Confirm_MyTickets_Email_ShowMessage_Text1 + " <span style='color: #ff5f6d;'>" + pageData.UserEmail + "</span> " + Resources.LocalizedText.Confirm_MyTickets_Email_ShowMessage_Text2);
        }

        protected void btnSMS_Click(object sender, EventArgs e)
        {
            Page.ClientScript.GetPostBackEventReference(new PostBackOptions(this));
            ApplicationHelpers.ShowMessage(this, Resources.LocalizedText.Confirm_MyTickets_SMS_ShowMessage_Text);
        }

        protected void btnCalendar_Click(object sender, EventArgs e)
        {
            Page.ClientScript.GetPostBackEventReference(new PostBackOptions(this));
            ApplicationHelpers.ShowMessage(this, Resources.LocalizedText.Confirm_MyTickets_Calendar_ShowMessage_Text);
        }

        protected void btnConfirmEmail_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var userid = User.Identity.GetUserId();
            string code = manager.GenerateEmailConfirmationToken(userid);
            string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, userid, Request);
            callbackUrl += "&bookid=" + pageData.BookingId;
            service.SendUnconfirmedTicket(pageData, callbackUrl);
            ApplicationHelpers.ShowMessage(this, Resources.LocalizedText.Confirm_UnconfirmedEmail_ResendLink_ShowMessage_Text1 + " <span style='color: #ff5f6d;'>" + pageData.UserEmail + "</span> " + Resources.LocalizedText.Confirm_UnconfirmedEmail_ResendLink_ShowMessage_Text2);
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