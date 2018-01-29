using System;
using MVP.Models.Entities;
using System.Collections.Generic;

namespace MVP.TripExplorer
{
    public class ExploreDTO
    {
        public List<Route> Routes { get; set; }

        public DateTime SelectedDate { get; set; }
        public Route SelectedRoute { get; set; }
        public AccessPoint SelectedSAP { get; set; }
        public AccessPoint SelectedDAP { get; set; }
        public TimeSpan SelectedTime { get; set; }

        public List<DateTime> Departure { get; set; }
    }
}
