using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
    }
}