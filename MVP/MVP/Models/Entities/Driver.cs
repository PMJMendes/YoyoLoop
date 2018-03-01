using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MVP.Models.Entities
{
    public class Driver
    {
        public Guid DriverId { get; set; }
        public bool Active { get; set; }

        public string Name { get; set; }
        public List<DriverAvailability> Availability { get; set; }

        public class DriverAvailability
        {
            public int Id { get; set; }
            public DayOfWeek DayOfWeek { get; set; }
            public TimeSpan StartTime { get; set; }
            public TimeSpan EndTime { get; set; }

            public DriverAvailability(DayOfWeek d, TimeSpan s, TimeSpan e)
            {
                DayOfWeek = d;
                StartTime = s;
                EndTime = e;
            }
        }
    }
}