using System;

namespace MVP.Models.Entities
{
    public class Corporate
    {
        public Guid CorporateId { get; set; }
        public bool Active { get; set; }

        public string CompanyName { get; set; }
    }
}