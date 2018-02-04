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
                result.Routes = model.Route.Include(r => r.StartRegion.AccessPoints).Include(r => r.EndRegion.AccessPoints).ToList();
            }

            result.Departure = new List<DateTime>();

            return result;
        }

        public void GetAvailableTripSlots(ExploreDTO state)
        {
            if (state.SelectedRoute == null)
            {
                return;
            }

            DateTime starttime = state.SelectedDate + state.SelectedRoute.MinStartTime;
            DateTime endtime = state.SelectedDate + state.SelectedRoute.MaxEndTime - state.SelectedRoute.Duration;
            TimeSpan interval = state.SelectedRoute.DepartureInterval;

            if (state.SelectedTime >= TimeSpan.Zero)
            {
                if (CheckAvailable(state, state.SelectedDate + state.SelectedTime))
                {
                    state.Departure.Add(state.SelectedDate + state.SelectedTime);
                }
            }
            else
            {
                while (starttime <= endtime)
                {
                    if (CheckAvailable(state, starttime))
                    {
                        state.Departure.Add(starttime);
                    }
                    starttime += interval;
                }
            }

            if (state.Departure.Count() == 0)
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
