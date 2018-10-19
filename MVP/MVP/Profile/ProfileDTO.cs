using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace MVP.Profile
{
    public class ProfileDTO
    {
        public string UserId { get; set; }
        public string ContactName { get; set; }
        public string BirthDate { get; set; }
        public string Email { get; set; }
        public bool EmailConfirmed { get; set; }
        public string PhoneCountryCode { get; set; }
        public string PhoneNumber { get; set; }
        public bool PhoneNumberConfirmed { get; set; }
        public bool Corporate { get; set; }

        public string BillingName { get; set; }
        public string BillingCompany { get; set; }
        public string BillingNIF { get; set; }
        public string BillingCostCenter { get; set; }
        public string BillingAddress { get; set; }
        public string BillingZIP { get; set; }
        public string BillingCity { get; set; }

        public string StripeCustomerId { get; set; }
        public string StripeCustomerDefaultSourceId { get; set; }
        public List<ListItem> StripeCardList { get; set; }
    }
}