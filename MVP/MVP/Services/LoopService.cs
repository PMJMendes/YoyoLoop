using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Net.Mail;
using System.Threading;
using System.Web;
using System.Web.Configuration;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using MVP.Models;
using MVP.Models.Entities;
using MVP.Models.Helpers;

namespace MVP.Services
{
    public class LoopService
    {
        public List<Route> GetRoutesFrom(Guid originId)
        {
            using (var model = new EntityModel())
            {
                return model.Route
                    .Where(route => route.Active && route.StartRegion.LoopedRegionId == originId)
                    .Include(route => route.StartRegion).Include(route => route.EndRegion)
                    .ToList();
            }
        }
    }

    public class ScheduleService
    {
        public List<TimeSpan> GetAvailableTimes(Guid routeId)
        {
            using (var model = new EntityModel())
            {
                return model.Departure
                    .Where(departure => departure.Active
                        && departure.Route.RouteId == routeId
                        && (departure.DayType == DayType.MONDAY
                            || departure.DayType == DayType.TUESDAY
                            || departure.DayType == DayType.WEDNESDAY
                            || departure.DayType == DayType.THURSDAY
                            || departure.DayType == DayType.FRIDAY))
                    .GroupBy(departure => departure.Time)
                    .Where(grp => grp.Count() >= 4)
                    .Select(grp => grp.Key).ToList();
            }
        }

        private bool isWeekDay(DayType dayType)
        {
            return dayType == DayType.MONDAY
                || dayType == DayType.TUESDAY
                || dayType == DayType.WEDNESDAY
                || dayType == DayType.THURSDAY
                || dayType == DayType.FRIDAY;
        }
    }
}
