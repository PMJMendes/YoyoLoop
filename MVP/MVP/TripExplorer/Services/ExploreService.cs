using MVP.Models;
using MVP.Models.Entities;
using MVP.TripExplorer;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace MVP.Services
{
    public class ExploreService
    {
        public ExploreDTO GetInitialData()
        {
            var result = new ExploreDTO();

            result.QueryString = new QueryString();

            using (var model = new EntityModel())
            {
                result.Settings = model.Settings.FirstOrDefault();

                result.Routes = model.Route.Include(r => r.StartRegion.AccessPoints)
                                           .Include(r => r.EndRegion.AccessPoints)
                                           .Include(d => d.Departures)
                                           .Include(f => f.Fares)
                                           .ToList();
            }

            result.Selection = new Selection { Date = DateTime.Today,
                                               Route = null,
                                               SAP = null,
                                               DAP = null,
                                               Time = new TimeSpan(-1)
                                              };
            result.DaySlots = new List<DaySlot>();

            return result;
        }

        public List<DaySlot> GetDaySlots(ExploreDTO state, DateTime startdate, DateTime enddate)
        {
            var result = new List<DaySlot>();
            var date = startdate;

            while(date <= enddate)
            {
                if(date >= DateTime.Today)
                {
                    result.Add(GetDay(state, date));
                }
                date = date + TimeSpan.FromDays(1);
            }

            return result;
        }

        public DaySlot GetDay(ExploreDTO state, DateTime date)
        {
            var result = new DaySlot();
            var daytype = GetDayType(date);

            result.Day = date;

            bool lastminute = Math.Ceiling((date - DateTime.Today).TotalDays) < state.Settings.LastMinuteThreshold;

            if (state.Selection.Route.Departures.Where(dt => dt.DayType == daytype).Count() > 0 && !lastminute)
            {
                result.Status = DaySlot.DayStatus.GREEN;
            }
            else
            {
                result.Status = DaySlot.DayStatus.RED;
            }

            if (lastminute)
            {
                result.Price = state.Selection.Route.Fares.Where(ft => ft.Type == Fare.FareType.LASTMINUTE).Select(p => p.Price).FirstOrDefault();
            }
            else
            {
                result.Price = state.Selection.Route.Fares.Where(ft => ft.Type == Fare.FareType.STANDARD).Select(p => p.Price).FirstOrDefault();
            }

            return result;
        }

        public DayType GetDayType(DateTime date)
        {
            // right now only returns day of week, eventually will check for holidays/eves

            return (DayType)date.DayOfWeek;
        }
    }
}
