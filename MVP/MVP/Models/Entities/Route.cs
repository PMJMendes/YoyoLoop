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

        public ICollection<Fare> Fares { get; set; }
    }

    public class Departure
    {
        public Guid DepartureId { get; set; }
        public Route Route { get; set; }
        public DayType DayType { get; set; }
        public TimeSpan Time { get; set; }
        public ICollection<Vehicle> Vehicles { get; set; }
    }

    public class Fare
    {
        public Guid FareId { get; set; }
        public Route Route { get; set; }
        public FareType FareType { get; set; }
        public Decimal Price { get; set; }
    }

    public enum FareType
    {
        STANDARD,
        LASTMINUTE,
        MEMBERGETMEMBER,
        PROMOTIONAL
    }
}