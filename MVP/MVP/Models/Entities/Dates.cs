using System;
using System.ComponentModel.DataAnnotations;

namespace MVP.Models.Entities
{
    public class Dates
    {
        [Key]
        public DateTime Date { get; set; }
        public DayType DayType { get; set; }
    }
}