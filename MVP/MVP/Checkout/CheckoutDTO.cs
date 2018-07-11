using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVP.Models.Entities;

namespace MVP.Checkout
{
    public class CheckoutDTO
    {
        public Guid BookingId { get; set; }
        public string UserId { get; set; }
        public string UserEmail { get; set; }
        public BookingStatus BookingStatus { get; set; }

        public int Seats { get; set; }
        public Fare.FareType FareType { get; set; }
        public decimal StandardPrice { get; set; }
        public decimal Price { get; set; }
        public string Promocode { get; set; }
        public bool PromoValid { get; set; }

        public decimal Cost { get; set; }
        public string TicketCode { get; set; }

        public DateTime StartTime { get; set; }
        public string StartRegionName { get; set; }
        public string StartAPName { get; set; }
        public string EndRegionName { get; set; }
        public string EndAPName { get; set; }
    }
}