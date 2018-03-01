using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MVP.Models.Entities
{
    public class Vehicle
    {
        public Guid VehicleId { get; set; }
        public string LicensePlate { get; set; }
        public bool Active { get; set; }

        public int Capacity { get; set; }
        public List<VehicleAvailability> Availability { get; set; }
    }

    public class VehicleAvailability
    {
        public Guid VehicleAvailabilityId { get; set; }
        public Vehicle Vehicle { get; set; }
        public DayOfWeek DayOfWeek { get; set; }
        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }
    }
}