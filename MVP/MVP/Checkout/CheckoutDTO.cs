using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using MVP.Models.Entities;

namespace MVP.Checkout
{
    public class CheckoutDTO
    {
        public Guid BookingId { get; set; }
        public string UserId { get; set; }
        public string UserContactName { get; set; }
        public string UserEmail { get; set; }
        public string UserReferredById { get; set; }
        public string UserMGMCode { get; set; }
        public bool Corporate { get; set; }
        public Guid CompanyId { get; set; }
        public string CompanyName { get; set; }
        public BookingStatus BookingStatus { get; set; }

        public string BillingName { get; set; }
        public string BillingCompany { get; set; }
        public string BillingNIF { get; set; }
        public string BillingCostCenter { get; set; }
        public string BillingAdress { get; set; }
        public string BillingZIP { get; set; }
        public string BillingCity { get; set; }
        public List<ListItem> BillingPassengers { get; set; }

        public int Seats { get; set; }
        public Fare.FareType FareType { get; set; }
        public decimal StandardPrice { get; set; }
        public decimal Price { get; set; }
        public string Promocode { get; set; }
        public string Code { get; set; }
        public bool PromoValid { get; set; }
        public bool MGM { get; set; }
        public bool UserMGM { get; set; }
        public decimal MGMPrice { get; set; }

        public decimal Cost { get; set; }
        public string TicketCode { get; set; }

        public DateTime StartTime { get; set; }
        public string StartRegionName { get; set; }
        public string StartAPName { get; set; }
        public string EndRegionName { get; set; }
        public string EndAPName { get; set; }

        public string StripeCustomerId { get; set; }
        public string StripeCustomerDefaultSourceId { get; set; }
        public List<ListItem> StripeCardList { get; set; }

        public string StripeChargeID { get; set; }

        public InvoiceData Invoice { get; set; }

        public class InvoiceData
        {
            public string Name { get; set; }
            public string Company { get; set; }
            public string NIF { get; set; }
            public string CostCenter { get; set; }
            public string Address { get; set; }
            public string ZIP { get; set; }
            public string City { get; set; }

            public string CompanyId { get; set; }
            public string CompanyName { get; set; }
            public string PayMethod { get; set; }

            public List<ListItem> Passengers { get; set; }
        }
    }
}