using System;
using System.Web;
using MVP.Services;
using Microsoft.AspNet.Identity;
using System.Web.UI;

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
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Page requires authenticated user\")</SCRIPT>"); // Needs pretty error message
                //Response.Redirect("/");
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

                    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Invalid Booking.\")</SCRIPT>");
                    //Response.Redirect("/Calendar/Calendar");
                }
                else if (pageData.UserId != User?.Identity.GetUserId())
                {
                    HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Wrong user.\")</SCRIPT>");
                    //Something went really terribly wrong here - email systems?
                    //Response.Redirect("/Calendar/Calendar");
                }
                var scheme = Request.Url.Scheme;
                var authority = Request.Url.Authority;
                pageData.TicketURL = scheme + "://" + authority + "/Ticket/Ticket?Id=" + pageData.BookingId.ToString();
                pageData.InviteURL = scheme + "://" + authority + "/Profile/Invite";
            }
            else
            {
                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Invalid QueryString.\")</SCRIPT>");
                //Response.Redirect("/Calendar/Calendar");
            }
        }

        protected void btnEmail_Click(object sender, EventArgs e)
        {
            service.SendTicket(pageData);
        }

        protected void btnSMS_Click(object sender, EventArgs e)
        {
            Page.ClientScript.GetPostBackEventReference(new PostBackOptions(this));
        }
    }
}