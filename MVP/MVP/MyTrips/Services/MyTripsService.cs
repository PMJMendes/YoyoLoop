using MVP.Models;
using MVP.Models.Entities;
using MVP.MyTrips;
using System;
using System.Web;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;


namespace MVP.Services
{
    public class MyTripsService
    {
        public MyTripsDTO GetInitialData()
        {
            var userid = HttpContext.Current.User.Identity.GetUserId();
            var result = new MyTripsDTO();

            using (var model = new EntityModel())
            {
                result.ActiveBookings = model.Booking.Where(b => b.UserId == userid && (b.Status == BookingStatus.BOOKED || b.Status == BookingStatus.PENDING)).
                                        Include(b => b.Trip.Departure.Route.StartRegion).
                                        Include(b => b.Trip.StartAccessPoint).
                                        Include(b => b.Trip.Departure.Route.EndRegion).
                                        Include(b => b.Trip.EndAccessPoint)
                                        .ToList();
                result.PastBookings = model.Booking.Where(b => b.UserId == userid && (b.Status == BookingStatus.COMPLETED || b.Status == BookingStatus.CANCELLED)).
                                        Include(b => b.Trip.Departure.Route.StartRegion).
                                        Include(b => b.Trip.StartAccessPoint).
                                        Include(b => b.Trip.Departure.Route.EndRegion).
                                        Include(b => b.Trip.EndAccessPoint)
                                        .ToList();
            }

            return result;
        }
    }
}
