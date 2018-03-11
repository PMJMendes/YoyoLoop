using System;
using MVP.Models.Entities;
using System.Collections.Generic;

namespace MVP.TripExplorer
{
    public class ExploreDTO
    {
        public QueryString QueryString { get; set; }
        public List<Route> Routes { get; set; }
        public Selection Selection { get; set; }
        public List<DaySlot> DaySlots { get; set; }
    }

    public class QueryString
    {
        public string Dest { get; set; }
    }

    public class Selection
    {
        public DateTime Date { get; set; }
        public Route Route { get; set; }
        public AccessPoint SAP { get; set; }
        public AccessPoint DAP { get; set;}
        public TimeSpan Time { get; set; }
    }

    public class DaySlot
    {
        public DateTime Day { get; set; }
        public SlotStatus Status { get; set; }
        public Decimal Price { get; set; }
    }

    public class TimeSlot
    {
        public TimeSpan Time { get; set; }
        public SlotStatus Status { get; set; }
    }

    public enum SlotStatus
    {
        GREEN,      // Available with selected parameters
        YELLOW,     // Available with different parameters
        RED         // Not available
    }
}
