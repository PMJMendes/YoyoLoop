using MVP.Models;
using MVP.Models.Entities;
using MVP.Confirm;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace MVP.Services
{
    public class ConfirmService
    {
        public ConfirmDTO GetInitialData()
        {
            var result = new ConfirmDTO {
                                            BookingId = Guid.Empty,
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
            var result = new ConfirmDTO();

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
                    result = null;
                }
                else
                {
                    result.BookingId = booking.BookingId;
                    result.Seats = booking.Seats;
                    result.Cost = booking.Cost;
                    result.TicketCode = booking.TicketCode;
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
