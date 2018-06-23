using MVP.Models;
using MVP.Models.Entities;
using MVP.Confirm;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using Microsoft.AspNet.Identity;

namespace MVP.Services
{
    public class ConfirmService
    {
        public ConfirmDTO GetInitialData(string userid)
        {
            var result = new ConfirmDTO
            {
                BookingId = Guid.Empty,
                UserId = "",
                UserEmail = "email@email.com",
                Seats = 0,
                Cost = 0,
                TicketCode = "#MYTICKETYO",
                StartTime = DateTime.Now,
                StartRegionName = "Start Region",
                StartAPName = "Start AP",
                EndRegionName = "End Region",
                EndAPName = "End AP"
            };
            return result;
        }

        public ConfirmDTO GetBooking(Guid id)
        {
            using (var model = new EntityModel())
            {
                var booking = model.Booking.Where(b => b.BookingId == id && b.Status == BookingStatus.BOOKED)
                                           .Include(t => t.Trip)
                                           .Include(sap => sap.Trip.StartAccessPoint)
                                           .Include(dap => dap.Trip.EndAccessPoint)
                                           .Include(sr => sr.Trip.StartAccessPoint.Region)
                                           .Include(er => er.Trip.EndAccessPoint.Region)
                                           .FirstOrDefault();
                if (booking == null)
                {
                    return null;
                }
                else
                {
                    var result = new ConfirmDTO
                    {
                        BookingId = booking.BookingId,
                        UserId = booking.UserId,
                        UserEmail = model.Users.Single(u => u.Id == booking.UserId).Email,
                        Seats = booking.Seats,
                        Cost = booking.Cost,
                        TicketCode = booking.TicketCode,
                        StartTime = booking.Trip.StartTime,
                        StartRegionName = booking.Trip.StartAccessPoint.Region.Name,
                        StartAPName = booking.Trip.StartAccessPoint.Name,
                        EndRegionName = booking.Trip.EndAccessPoint.Region.Name,
                        EndAPName = booking.Trip.EndAccessPoint.Name
                    };
                    return result;
                }
            }
        }
    }
}
