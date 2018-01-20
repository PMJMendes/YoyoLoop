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
                result.Routes = model.Route.Include(r => r.StartRegion).Include(r => r.EndRegion).ToList();
            }

            //Initialize collections that will be needed later, to avoid Null Pointer Exceptions
            result.DepartureTimes = new List<TimeSpan>();
            result.SourceAccessPoints = new List<AccessPoint>();
            result.DestinationAccessPoints = new List<AccessPoint>();

            return result;
        }

        public void GetAvailableTripSlots(ExploreDTO state)
        {
            if (state.SelectedRoute != null && state.SelectedDate != null)
            {
                TimeSpan starttime = state.SelectedRoute.MinStartTime;
                TimeSpan endtime = state.SelectedRoute.MaxEndTime - state.SelectedRoute.Duration;
                TimeSpan interval = state.SelectedRoute.DepartureInterval;

                state.DepartureTimes = new List<TimeSpan>();
                while (starttime < endtime)
                {
                    state.DepartureTimes.Add(starttime); // add remaining data later
                    starttime += interval;
                }

                using (var model = new EntityModel())
                {
                    state.SourceAccessPoints = model.AccessPoint.Where(ap => ap.Region.LoopedRegionId == state.SelectedRoute.StartRegion.LoopedRegionId).ToList();
                    state.DestinationAccessPoints = model.AccessPoint.Where(ap => ap.Region.LoopedRegionId == state.SelectedRoute.EndRegion.LoopedRegionId).ToList();
                }
            }
        }
    }
}
