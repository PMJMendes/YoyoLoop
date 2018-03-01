using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MVP.Models.Entities
{
    public class Route
    {
        public Guid RouteId { get; set; }
        public bool Active { get; set; }
        
        public LoopedRegion StartRegion { get; set; }
        public LoopedRegion EndRegion { get; set; }
        public ICollection<Departure> Departures { get; set; }

        public TimeSpan Duration { get; set; }
    }

    public class Departure
    {
        public Guid DepartureId { get; set; }
        public Route Route { get; set; }
        public DayOfWeek Day { get; set; }
        public TimeSpan Time { get; set; }
    }
}