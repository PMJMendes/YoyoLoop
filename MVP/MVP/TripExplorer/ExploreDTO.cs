using MVP.Models.Entities;
using System.Collections.Generic;

namespace MVP.TripExplorer
{
    public class ExploreDTO
    {
        public List<Route> Routes { get; set; }

        public Route SelectedRoute { get; set; }
    }
}
