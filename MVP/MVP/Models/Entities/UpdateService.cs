using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVP.Models.Entities
{
    public class UpdateService
    {
        public Guid UpdateServiceId { get; set; }
        public DateTime LastRun { get; set; }
        public DateTime LastDaily { get; set; }
        public TimeSpan WarningThreshold { get; set; }
    }
}