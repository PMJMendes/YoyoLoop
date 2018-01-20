using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVP.Models.Entities
{
    public class Trip
    {
        public Guid TripId { get; set; }

        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }

        public AccessPoint StartAccessPoint { get; set; }
        public AccessPoint EndAccessPoint { get; set; }

    }
}