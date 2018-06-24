using System;
using MVP.Models.Entities;
using System.Collections.Generic;

namespace MVP.Calendar
{
    public class CalendarDTO
    {
        public List<Route> Routes { get; set; }
        public Selection Selection { get; set; }
        public List<DaySlot> DaySlots { get; set; }
    }

    public class Selection
    {
        public DateTime Date { get; set; }
        public Route Route { get; set; }
        public AccessPoint SAP { get; set; }
        public AccessPoint DAP { get; set;}
        public TimeSpan Time { get; set; }
        public Decimal Price { get; set; }
        public int Seats { get; set; }
        public Guid DepartureId { get; set; }
    }

    [Serializable]
    public class DaySlot
    {
        public DateTime Day { get; set; }
        public SlotStatus Status { get; set; }
        public Decimal Price { get; set; }
    }

    public class APGroup
    {
        public string StartAPName { get; set; }
        public string EndAPName { get; set; }
        public List<TimeSlot> Times { get; set; }
    }

    public class TimeSlot
    {
        public Departure Departure { get; set; }
        public SlotStatus Status { get; set; }
    }

    public enum SlotStatus 
    {
        NONE,       // unavailable
        GREEN,      // plenty of seats
        YELLOW,     // limited
        RED,        // almost full
        BLACK       // sold out
    }
}
