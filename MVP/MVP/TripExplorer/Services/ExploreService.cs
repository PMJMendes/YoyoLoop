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

            result.DepartureTimes = new List<TimeSpan>();

            return result;
        }

        public void GetAvailableTripSlots(ExploreDTO state)
        {
            if (state.SelectedRoute == null)
            {
                return;
            }

            TimeSpan starttime = state.SelectedRoute.MinStartTime;
            TimeSpan endtime = state.SelectedRoute.MaxEndTime - state.SelectedRoute.Duration;
            TimeSpan interval = state.SelectedRoute.DepartureInterval;

            state.DepartureTimes = new List<TimeSpan>();

            while (starttime < endtime)
            {
                if (CheckAvailable(state, starttime))
                {
                    state.DepartureTimes.Add(starttime);
                }

                starttime += interval;
            }
        }

        private bool CheckAvailable(ExploreDTO state, TimeSpan starttime)
        {
            //This is where we check whether we have an available car
            return true;
        }
    }
}
