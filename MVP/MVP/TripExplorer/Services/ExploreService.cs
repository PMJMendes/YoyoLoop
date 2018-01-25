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
                result.Regions = model.LoopedRegion.ToList();
            }

            //Initialize collections that will be needed later, to avoid Null Pointer Exceptions
            result.SourceRegion = new LoopedRegion();
            result.DestinationRegion = new LoopedRegion();
            result.SelectedSAP = new AccessPoint();
            result.SelectedDAP = new AccessPoint();
            result.SourceAccessPoints = new List<AccessPoint>();
            result.DestinationAccessPoints = new List<AccessPoint>();
            result.TripSlots = new List<ExploreDTO.TripSlot>();

            return result;
        }

        public void GetAccessPoints (ExploreDTO state)
        {
            using (var model = new EntityModel())
            {
                if(state.SourceRegion != null) state.SourceAccessPoints = model.AccessPoint.Where(ap => ap.Region.LoopedRegionId == state.SourceRegion.LoopedRegionId).ToList();
                if(state.DestinationRegion != null) state.DestinationAccessPoints = model.AccessPoint.Where(ap => ap.Region.LoopedRegionId == state.DestinationRegion.LoopedRegionId).ToList();
            }
        }

        public void GetAvailableTripSlots(ExploreDTO state)
        {
            if (state.SelectedRoute != null && state.SelectedDate != null)
            {
                TimeSpan starttime = state.SelectedRoute.MinStartTime;
                TimeSpan endtime = state.SelectedRoute.MaxEndTime - state.SelectedRoute.Duration;
                TimeSpan interval = state.SelectedRoute.DepartureInterval;

                state.TripSlots = new List<ExploreDTO.TripSlot>();

                while (starttime < endtime)
                {
                    if(state.SelectedSAP == null)
                    {
                        foreach (AccessPoint sap in state.SourceAccessPoints)
                        {
                            if(state.SelectedDAP == null)
                            {
                                foreach (AccessPoint dap in state.DestinationAccessPoints)
                                {
                                    state.TripSlots.Add(new ExploreDTO.TripSlot(state.SelectedDate + starttime,
                                                                                state.SourceRegion,
                                                                                state.DestinationRegion,
                                                                                sap,
                                                                                dap,
                                                                                state.SelectedDate + starttime + state.SelectedRoute.Duration));
                                }
                            }
                            else
                            {
                                state.TripSlots.Add(new ExploreDTO.TripSlot(state.SelectedDate + starttime,
                                                                            state.SourceRegion,
                                                                            state.DestinationRegion,
                                                                            sap,
                                                                            state.SelectedDAP,
                                                                            state.SelectedDate + starttime + state.SelectedRoute.Duration));
                            }
                        }
                    }
                    else
                    {
                        if(state.SelectedDAP == null)
                        {
                            foreach (AccessPoint dap in state.DestinationAccessPoints)
                            {
                                state.TripSlots.Add(new ExploreDTO.TripSlot(state.SelectedDate + starttime,
                                                                            state.SourceRegion,
                                                                            state.DestinationRegion,
                                                                            state.SelectedSAP,
                                                                            dap,
                                                                            state.SelectedDate + starttime + state.SelectedRoute.Duration));
                            }
                        }
                        else
                        {
                            state.TripSlots.Add(new ExploreDTO.TripSlot(state.SelectedDate + starttime,
                                                                state.SourceRegion,
                                                                state.DestinationRegion,
                                                                state.SelectedSAP,
                                                                state.SelectedDAP,
                                                                state.SelectedDate + starttime + state.SelectedRoute.Duration));
                        }
                    }
                    starttime += interval;
                }
            }
        }
    }
}
