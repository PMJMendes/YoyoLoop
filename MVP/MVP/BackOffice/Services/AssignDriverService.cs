using MVP.Models;
using MVP.Models.Entities;
using MVP.BackOffice;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web.UI.WebControls;

namespace MVP.Services
{
    public class AssignDriverService
    {
        private readonly MasterService masterService = new MasterService();

        public AssignDriverDTO GetInitialData()
        {
            var result = new AssignDriverDTO
            {
                Drivers = new List<ListItem>(),
                Trips = new List<TripDetail>()
            };

            using (var model = new EntityModel())
            {
                var drivers = model.Driver.Where(d => d.Active);
                foreach (Driver d in drivers)
                {
                    var driver = new ListItem(d.Name, d.DriverId.ToString());
                    result.Drivers.Add(driver);
                }

                var trips = model.Trip.Include(t => t.StartAccessPoint)
                                      .Include(t => t.EndAccessPoint)
                                      .Include(ap => ap.StartAccessPoint.Region)
                                      .Include(ap => ap.EndAccessPoint.Region)
                                      .Include(t => t.Driver)
                                      .Where(t => t.Status == TripStatus.BOOKED && t.StartTime > DateTime.Now);
                foreach (Trip t in trips)
                {
                    var trip = new TripDetail
                    {
                        TripID = t.TripId,
                        StartTime = t.StartTime,
                        StartRegion = t.StartAccessPoint.Region.Name,
                        StartAP = t.StartAccessPoint.Name,
                        EndRegion = t.EndAccessPoint.Region.Name,
                        EndAP = t.EndAccessPoint.Name,
                        Driver = new ListItem(t.Driver?.Name ?? String.Empty, t.Driver?.DriverId.ToString() ?? string.Empty)
                    };
                    result.Trips.Add(trip);
                }
            }

            result.Trips = result.Trips.OrderBy(t => t.StartTime).ToList();
            return result;
        }

        public int UpdateTrips(AssignDriverDTO state)
        {
            int result = 0;
            List<Trip> updatedtrips = new List<Trip>();

            using (var model = new EntityModel())
            {
                foreach(TripDetail td in state.Trips)
                {
                    if(!string.IsNullOrEmpty(td.Driver.Value))
                    {
                        Guid driverid;
                        if(Guid.TryParse(td.Driver.Value, out driverid))
                        {
                            var trip = model.Trip.Single(t => t.TripId == td.TripID);
                            var driver = model.Driver.FirstOrDefault(d => d.DriverId == driverid);
                            if(trip.Driver?.DriverId != driverid)
                            {
                                model.Trip.Single(t => t.TripId == td.TripID).Driver = driver;
                                model.SaveChanges();
                                if(trip.StartTime > DateTime.Now && trip.StartTime.Date < DateTime.Now.AddDays(2).Date)
                                {
                                    updatedtrips.Add(model.Trip.Include(t => t.StartAccessPoint).Include(ap => ap.StartAccessPoint.Region)
                                                               .Include(t => t.EndAccessPoint).Include(ap => ap.EndAccessPoint.Region)
                                                               .Include(t => t.Driver)
                                                               .Include(t => t.Bookings)
                                                               .Include(t => t.Departure)
                                                               .Single(t => t.TripId == td.TripID));
                                }
                                result++;
                            }
                        }
                    }
                }
            }

            if (updatedtrips.Any())
            {
                masterService.SendTripDetails(updatedtrips);
            }
            return result;
        }
    }
}
