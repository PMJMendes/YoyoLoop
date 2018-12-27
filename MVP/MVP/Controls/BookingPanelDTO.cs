using MVP.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVP.Controls
{
    [Serializable]
    public class BookingPanelDTO
    {
        public bool BookingValid { get; set; }
        public string Trigger { get; set; }

        public int Seats { get; set; }
        public Fare.FareType FareType { get; set; }
        public decimal StandardPrice { get; set; }
        public decimal Price { get; set; }
        public decimal StandardCost { get; set; }
        public decimal Cost { get; set; }
        public List<PriceItem> PriceSummary { get; set; }
        public string Promocode { get; set; }
        public bool PromoValid { get; set; }
        public bool MGM { get; set; }
        public bool UserMGM { get; set; }
        public decimal MGMPrice { get; set; }

        public DateTime StartTime { get; set; }
        public DateTime ArrivalTime { get; set; }
        public string StartRegionName { get; set; }
        public string StartAPName { get; set; }
        public string EndRegionName { get; set; }
        public string EndAPName { get; set; }

        [Serializable]
        public class PriceItem
        {
            public string Description { get; set; }
            public string Value { get; set; }
            public PriceItemType Type { get; set; }
        }

        public enum PriceItemType
        {
            NORMAL,
            DISCOUNT,
            NEUTRAL
        }
    }
}