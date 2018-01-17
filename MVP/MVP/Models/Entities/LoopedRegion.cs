using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVP.Models.Entities
{
    public class LoopedRegion
    {
        public Guid LoopedRegionId { get; set; }
        public string Name { get; set; }

        public ICollection<AccessPoint> AccessPoint { get; set; }

        public static implicit operator LoopedRegion(Guid v)
        {
            throw new NotImplementedException();
        }
    }
}