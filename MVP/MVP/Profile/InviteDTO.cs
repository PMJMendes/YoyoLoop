using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVP.Profile
{
    public class InviteDTO
    {
        public string UserId { get; set; }
        public int AmountSaved { get; set; }
        public int MGMTrips { get; set; }
        public string UserMGMCode { get; set; }
    }
}