using System;
using System.Data.Entity;
using System.Linq;
using MVP.Models;
using MVP.Models.Entities;
using MVP.Ticket;

namespace MVP.Services
{
    public class TicketService
    {
        public TicketDTO GetInitialData()
        {
            var result = new TicketDTO
            {
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

        public TicketDTO GetBooking(Guid id)
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
                    var result = new TicketDTO
                    {
                        BookingId = booking.BookingId,
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
