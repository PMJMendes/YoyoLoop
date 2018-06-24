using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MVP.Models.Entities;

namespace MVP.MyTrips
{
    public partial class Ticket : System.Web.UI.UserControl
    {
        public Booking TicketBooking { get; set; }
    }
}