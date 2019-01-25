using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using MVP.Models.Entities;

namespace MVP.BackOffice
{
    public class AssignDriverDTO
    {
        public List<ListItem> Drivers;
        public List<TripDetail> Trips;
    }

    public class TripDetail
    {
        public Guid TripID;
        public DateTime StartTime;
        public string StartRegion;
        public string StartAP;
        public string EndRegion;
        public string EndAP;
        public ListItem Driver;
        public List<BookingDetail> Bookings;
    }

    public class BookingDetail
    {
        public string User;
        public string Seats;
        public string Cost;
    }
}