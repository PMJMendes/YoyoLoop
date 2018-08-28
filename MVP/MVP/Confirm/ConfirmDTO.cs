using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVP.Models.Entities;

namespace MVP.Confirm
{
    public class ConfirmDTO
    {
        public Guid BookingId { get; set; }
        public string UserId { get; set; }
        public int Seats { get; set; }
        public decimal Cost { get; set; }
        public string TicketCode { get; set; }
        public string TicketURL { get; set; }

        public DateTime StartTime { get; set; }
        public string StartRegionName { get; set; }
        public string StartAPName { get; set; }
        public string StartAPLocation { get; set; }
        public string EndRegionName { get; set; }
        public string EndAPName { get; set; }
        public string EndAPLocation { get; set; }

        public string UserEmail { get; set; }
        public bool UserEmailConfirmed { get; set; }
        public string UserContactName { get; set; }

        public string InviteURL { get; set; }
        public string MGMCode { get; set; }
    }
}