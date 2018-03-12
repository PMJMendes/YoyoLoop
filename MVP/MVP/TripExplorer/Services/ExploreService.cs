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

            result.QueryString = new QueryString();

            using (var model = new EntityModel())
            {
                result.Routes = model.Route.Include(r => r.StartRegion.AccessPoints)
                                           .Include(r => r.EndRegion.AccessPoints)
                                           .Include(d => d.Departures)
                                           .Include(f => f.Fares)
                                           .ToList();
            }

            result.Selection = new Selection { Date = DateTime.MinValue,
                                               Route = null,
                                               SAP = null,
                                               DAP = null,
                                               Time = new TimeSpan(-1),
                                               Price = 0,
                                               Seats = 1,
                                               Trip = null
                                              };
            result.DaySlots = new List<DaySlot>();

            return result;
        }

        public List<DaySlot> GetDaySlots(ExploreDTO state, DateTime startdate, DateTime enddate)
        {
            var result = new List<DaySlot>();
            var date = startdate;

            while(date <= enddate)
            {
                if(date >= DateTime.Today)
                {
                    result.Add(GetDay(state, date));
                }
                date = date + TimeSpan.FromDays(1);
            }

            return result;
        }

        public DaySlot GetDay(ExploreDTO state, DateTime date)
        {
            var result = new DaySlot();
            var model = new EntityModel();
            var daytype = GetDayType(date);

            result.Day = date;

            bool lastminute = Math.Ceiling((date - DateTime.Today).TotalDays) < model.Settings.Select(s => s.LastMinuteThreshold).First();

            if (state.Selection.Route.Departures.Where(dt => dt.DayType == daytype).Count() > 0 && !lastminute)
            {
                result.Status = SlotStatus.GREEN;
            }
            else
            {
                result.Status = SlotStatus.RED;
            }

            if (lastminute)
            {
                result.Price = state.Selection.Route.Fares.Where(ft => ft.Type == Fare.FareType.LASTMINUTE).Select(p => p.Price).FirstOrDefault();
            }
            else
            {
                result.Price = state.Selection.Route.Fares.Where(ft => ft.Type == Fare.FareType.STANDARD).Select(p => p.Price).FirstOrDefault();
            }

            return result;
        }

        public DayType GetDayType(DateTime date)
        {
            // right now only returns day of week, eventually will check for holidays/eves

            return (DayType)date.DayOfWeek;
        }

        public List<TimeSlot> GetTimeSlots(ExploreDTO state)
        {
            var result = new List<TimeSlot>();
            var model = new EntityModel();
            bool lastminute = Math.Ceiling((state.Selection.Date - DateTime.Today).TotalDays) < model.Settings.Select(s => s.LastMinuteThreshold).First();

            // Will loop through trips here

            foreach (Departure d in state.Selection.Route.Departures.Where(d => d.DayType == GetDayType(state.Selection.Date)))
            {
                var slot = new TimeSlot();

                slot.Time = d.Time;

                // All slot conditions will be checked here to determine status
                if (lastminute)
                {
                    slot.Status = SlotStatus.RED;
                }
                else
                {
                    slot.Status = SlotStatus.GREEN;
                }

                result.Add(slot);
            }
            return result;
        }

        public Booking CreateBooking(ExploreDTO state)
        {
            var model = new EntityModel();
            var trip = new Trip();

            if(state.Selection.Trip == null)
            {
                trip = CreateTrip(state);
            }
            else
            {
                trip = state.Selection.Trip;
            }

            var booking = new Booking()
            {
                BookingId = Guid.NewGuid(),
                Status = Booking.BookingStatus.PENDING,
                CreationTime = DateTime.Now,
                Trip = model.Trip.Single(t => t.TripId == trip.TripId),
                Seats = state.Selection.Seats,
                Cost = state.Selection.Seats * state.Selection.Price
            };
            model.Booking.Add(booking);
            model.SaveChanges();

            return booking;
        }

        public void UpdateBooking(Guid id, Booking.BookingStatus status) //this will take a booking, right now its taking an id for payment debug
        {
            var model = new EntityModel();
            var booking = model.Booking.SingleOrDefault(b => b.BookingId == id);

            if(booking != null)
            {
                booking.Status = status;
                model.SaveChanges();

                //check and update the corresponding trip status here
            }
        }

        public Trip CreateTrip(ExploreDTO state)
        {
            var model = new EntityModel();
            var trip = new Trip()
            {
                TripId = Guid.NewGuid(),
                Status = Trip.TripStatus.PENDING,
                StartTime = state.Selection.Date + state.Selection.Time,
                Route = model.Route.Single(b => b.RouteId == state.Selection.Route.RouteId),
                StartAccessPoint = model.AccessPoint.Single(ap => ap.AccessPointId == state.Selection.SAP.AccessPointId),
                EndAccessPoint = model.AccessPoint.Single(ap => ap.AccessPointId == state.Selection.DAP.AccessPointId)
            };
            model.Trip.Add(trip);
            model.SaveChanges();
            return trip;
        }
    }
}
