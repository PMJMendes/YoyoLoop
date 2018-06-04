using MVP.Models;
using MVP.Models.Entities;
using MVP.Checkout;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace MVP.Services
{
    public class CheckoutService
    {
        public CheckoutDTO GetInitialData()
        {
            var result = new CheckoutDTO();

            return result;
        }

        public CheckoutDTO GetBooking(Guid id)
        {
            var result = new CheckoutDTO();

            using (var model = new EntityModel())
            {
                var booking = model.Booking.Where(b => b.BookingId == id && b.Status == BookingStatus.PENDING)
                                           .Include(t => t.Trip)
                                           .Include(sap => sap.Trip.StartAccessPoint)
                                           .Include(dap => dap.Trip.EndAccessPoint)
                                           .Include(sr => sr.Trip.StartAccessPoint.Region)
                                           .Include(er => er.Trip.EndAccessPoint.Region)
                                           .FirstOrDefault();
                if(booking == null)
                {
                    result = null;
                }
                else
                {
                    result.BookingId = booking.BookingId;
                    result.Seats = booking.Seats;
                    result.Cost = booking.Cost;
                    result.StartTime = booking.Trip.StartTime;
                    result.StartRegionName = booking.Trip.StartAccessPoint.Region.Name;
                    result.StartAPName = booking.Trip.StartAccessPoint.Name;
                    result.EndRegionName = booking.Trip.EndAccessPoint.Region.Name;
                    result.EndAPName = booking.Trip.EndAccessPoint.Name;
                }
            }
            return result;
        }
    }
}
