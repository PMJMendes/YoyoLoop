using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVP.Models.Entities
{
    public class Route
    {
        public Guid RouteId { get; set; }
        
        public LoopedRegion StartRegion { get; set; }
        public LoopedRegion EndRegion { get; set; }

        public TimeSpan MinStartTime { get; set; }
        public TimeSpan MaxEndTime { get; set; }
        public TimeSpan Duration { get; set; }
        public TimeSpan DepartureInterval { get; set; }

    }
}