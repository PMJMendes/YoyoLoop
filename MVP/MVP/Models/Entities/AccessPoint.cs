using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVP.Models.Entities
{
    public class AccessPoint
    {
        public Guid AccessPointId { get; set; }
        public string Name { get; set; }

        public LoopedRegion Region { get; set; }

    }
}