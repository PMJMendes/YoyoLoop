using MVP.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.MyTrips
{
    public partial class PastTicket : System.Web.UI.UserControl
    {
        public Booking TicketBooking { get; set; }
    }
}