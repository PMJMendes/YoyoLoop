using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVP.Models.Entities
{
    public class Trip
    {
        public Guid TripId { get; set; }
        public TripStatus Status { get; set; }

        public DateTime StartTime { get; set; }
        public Departure Departure { get; set; } // Not needed but makes it easier to handle code loops
        public AccessPoint StartAccessPoint { get; set; }
        public AccessPoint EndAccessPoint { get; set; }

        public ICollection<Booking> Bookings { get; set; }

        public Vehicle Vehicle { get; set; }
        public Driver Driver { get; set; }

        public DateTime CalcArrivalTime()
        {
            return StartTime +
                   Departure.Route.Duration +
                   Departure.DurationModifier +
                   StartAccessPoint.DurationModifier +
                   EndAccessPoint.DurationModifier;
        }
    }

    public enum TripStatus
    {
        CANCELLED,
        PENDING,
        BOOKED,
        CLOSED,
        FULL,
        COMPLETED
    }
}