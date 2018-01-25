using System;
using MVP.Models.Entities;
using System.Collections.Generic;

namespace MVP.TripExplorer
{
    public class ExploreDTO
    {
        public class TripSlot
        {
            public DateTime Departure { get; set; }
            public LoopedRegion SourceRegion { get; set; }
            public LoopedRegion DestinationRegion { get; set; }
            public AccessPoint SourceAccessPoint { get; set; }
            public AccessPoint DestinationAccessPoint { get; set; }
            public DateTime Arrival { get; set; }

            public TripSlot(DateTime d, LoopedRegion sr, LoopedRegion dr, AccessPoint sap, AccessPoint dap, DateTime at)
            {
                this.Departure = d;
                this.SourceRegion = sr;
                this.DestinationRegion = dr;
                this.SourceAccessPoint = sap;
                this.DestinationAccessPoint = dap;
                this.Arrival = at;
            }

        }

        public List<Route> Routes { get; set; }
        public List<LoopedRegion> Regions { get; set; }

        public LoopedRegion SourceRegion { get; set; }
        public LoopedRegion DestinationRegion { get; set; }

        public List<AccessPoint> SourceAccessPoints { get; set; }
        public List<AccessPoint> DestinationAccessPoints { get; set; }

        public Route SelectedRoute { get; set; }
        public DateTime SelectedDate { get; set; }
        public AccessPoint SelectedSAP { get; set; }
        public AccessPoint SelectedDAP { get; set; }

        public List<TripSlot> TripSlots { get; set; }
    }
}
