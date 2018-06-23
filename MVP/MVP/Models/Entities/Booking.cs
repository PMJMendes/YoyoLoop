using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVP.Models.Entities
{
    public class Booking
    {
        public Guid BookingId { get; set; }
        public BookingStatus Status { get; set; }
        public ApplicationUser User { get; set; }
        public string TicketCode { get; set; }

        public DateTime CreationTime { get; set; }
        public Trip Trip { get; set; }
        public int Seats { get; set; }
        public Decimal Cost { get; set; }
    }

    public enum BookingStatus
    {
        CANCELLED,
        PENDING,
        BOOKED,
        COMPLETED
    }
}