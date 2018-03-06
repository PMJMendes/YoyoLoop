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
                result.Routes = model.Route.Include(r => r.StartRegion.AccessPoints)
                                           .Include(r => r.EndRegion.AccessPoints)
                                           .Include(d => d.Departures)
                                           .ToList();
            }

            result.Selection = new Selection { Date = DateTime.Today,
                                               Route = null,
                                               SAP = null,
                                               DAP = null,
                                               Time = new TimeSpan(-1)
                                              };
            result.MonthDaySlots = new List<DaySlot>();

            return result;
        }

        public List<DaySlot> GetAvailableMonthDaySlots(ExploreDTO state, DateTime date)
        {
            var result = new List<DaySlot>();

            if (date.Month < DateTime.Today.Month) // Month in the past
            {
                return result;
            }

            // Loop through days, checking trips table and route departures for each, validating on each iteration

            return result;

            /* [OBSOLETE]
            
            if (state.SelectedRoute == null)
            {
                return;
            }

            state.AvailableTripSlots.Clear();

            if (state.SelectedTime >= TimeSpan.Zero)
            {
                if (CheckAvailable(state, state.SelectedDate + state.SelectedTime))
                {
                    state.AvailableTripSlots.Add(new TripSlot(state.SelectedDate + state.SelectedTime,
                                                              state.SelectedRoute.StartRegion,
                                                              state.SelectedRoute.EndRegion,
                                                              state.SelectedSAP,
                                                              state.SelectedDAP,
                                                              state.SelectedDate + state.SelectedTime + state.SelectedRoute.Duration));
                }
            }
            else
            {
                foreach (Departure d in state.SelectedRoute.Departures)
                {
                    if (CheckAvailable(state, state.SelectedDate + d.Time))
                    {
                        state.AvailableTripSlots.Add(new TripSlot(state.SelectedDate + d.Time,
                                                                  state.SelectedRoute.StartRegion,
                                                                  state.SelectedRoute.EndRegion,
                                                                  state.SelectedSAP,
                                                                  state.SelectedDAP,
                                                                  state.SelectedDate + d.Time + state.SelectedRoute.Duration));
                    }
                }
            }

            if (state.AvailableTripSlots.Count() == 0)
            {
                // Oops, no trips with selected criteria; Show alternatives.
            }
            */
        }

        private bool CheckAvailable(ExploreDTO state, DateTime day)
        {
            // expire validating trips

            //This is where we check whether we have an available car
            return true;
        }

    }
}
