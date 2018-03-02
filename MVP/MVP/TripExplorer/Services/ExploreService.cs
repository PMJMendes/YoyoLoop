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

            using (var model = new EntityModel())
            {
                result.Routes = model.Route.Include(r => r.StartRegion.AccessPoints)
                                           .Include(r => r.EndRegion.AccessPoints)
                                           .Include(d => d.Departures)
                                           .ToList();
            }

            result.AvailableTripSlots = new List<TripSlot>();

            return result;
        }

        public void GetAvailableTripSlots(ExploreDTO state)
        {
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
        }

        private bool CheckAvailable(ExploreDTO state, DateTime starttime)
        {
            // expire validating trips

            //This is where we check whether we have an available car
            return true;
        }

    }
}
