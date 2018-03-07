using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVP.Models.Entities
{
    public class Settings
    {
        public int Id { get; set; }
        public TimeSpan BookTimeout { get; set; } // Timeout for a booking to get processed by the payment provider
        public int VehicleCapacity { get; set; } // To be moved to Vehicle at a later date
        public int LastMinuteThreshold { get; set; } // in days
        public TimeSpan MinTimeBookLastMinute { get; set; } // Minimum time to book a trip before departure time
    }
}