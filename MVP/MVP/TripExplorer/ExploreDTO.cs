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
        public List<DaySlot> MonthDaySlots { get; set; }
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
        public TimeSpan Time { get; set; } // this is probably no longer needed
    }

    public class DaySlot
    {
        public DateTime Day { get; set; }
        public DayStatus Status { get; set; }
        public Decimal Price { get; set; }
 
        public enum DayStatus
        {
            GREEN,      // Available trips with selected parameters
            YELLOW,     // Available trips with different parameters
            RED         // No available trips
        }
    }
}
