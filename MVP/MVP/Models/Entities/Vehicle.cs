using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MVP.Models.Entities
{
    public class Vehicle
    {
        public Guid VehicleId { get; set; }
        public bool Active { get; set; }

        public string Plate { get; set; }
        public int Capacity { get; set; }
        public List<VehicleAvailability> Availability { get; set; }

        public class VehicleAvailability
        {
            public int Id { get; set; }
            public DayOfWeek DayOfWeek { get; set; }
            public TimeSpan StartTime { get; set; }
            public TimeSpan EndTime { get; set; }

            public VehicleAvailability(DayOfWeek d, TimeSpan s, TimeSpan e)
            {
                DayOfWeek = d;
                StartTime = s;
                EndTime = e;
            }
        }
    }
}