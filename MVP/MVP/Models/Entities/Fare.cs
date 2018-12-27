using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVP.Models.Entities
{
    public class Fare
    {
        public Guid FareId { get; set; }
        public Route Route { get; set; }
        public FareType Type { get; set; }
        public Decimal Price { get; set; }

        public enum FareType
        {
            STANDARD,
            LASTMINUTE,
            MEMBERGETMEMBER,
            PROMOTIONAL,
            FREE,
            SPECIAL1,
            SPECIAL2
        }
    }

    public static class FareExtentions
    {
        public static bool IsPromocode(this Fare.FareType type)
        {
            if (type >= Fare.FareType.PROMOTIONAL)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}