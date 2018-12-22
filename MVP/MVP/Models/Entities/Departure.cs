using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVP.Models.Entities
{
    public class Departure
    {
        public Guid DepartureId { get; set; }
        public bool Active { get; set; }

        public Route Route { get; set; }
        public DayType DayType { get; set; }
        public TimeSpan Time { get; set; }
        public TimeSpan DurationModifier { get; set; }
        public ICollection<Vehicle> Vehicles { get; set; }
    }
}