using MVP.Models.Extensions;
using MVP.Services;
using System;
using System.Web;
using System.Web.UI;

namespace MVP.Ticket
{
    public partial class Ticket : System.Web.UI.Page
    {
        private readonly TicketService service = new TicketService();
        protected TicketDTO pageData;

        protected void Page_Init(object sender, EventArgs e)
        {
            // Load scripts
            ScriptManager mgr = ScriptManager.GetCurrent(this.Page);

            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/vendor/jquery/jquery.min.js") });
            mgr.Scripts.Add(new ScriptReference { Path = Context.VersionedContent("~/vendor/bootstrap/js/bootstrap.bundle.min.js") });
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
        }

        private void InitData()
        {
            pageData = null;

            if (IsPostBack)
            {
                pageData = (TicketDTO)Session["ticket.data"];
            }

            if (pageData == null)
            {
                pageData = service.GetInitialData();
                ProcessQueryString();
                Session["ticket.data"] = pageData;
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
                    pageData = new TicketDTO
                    {
                        BookingId = Guid.Empty,
                        Seats = 0,
                        Cost = 0,
                        TicketCode = "#MYTICKETYO",
                        StartTime = DateTime.Now,
                        StartRegionName = "Start Region",
                        StartAPName = "Start AP",
                        EndRegionName = "End Region",
                        EndAPName = "End AP"
                    };

                    DisplayError();
                }
                else
                {
                    DisplaySuccess();
                }
            }
            else
            {
                DisplayError();
            }
        }

        private void DisplaySuccess()
        {
            phSucess.Visible = true;
            phError.Visible = false;
        }

        private void DisplayError()
        {
            phSucess.Visible = false;
            phError.Visible = true;
        }
    }
}