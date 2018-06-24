using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVP.Models.Entities;

namespace MVP.MyTrips
{
    public class MyTripsDTO
    {
        public List<Booking> ActiveBookings { get; set; }
        public List <Booking> PastBookings { get; set; }
    }
}