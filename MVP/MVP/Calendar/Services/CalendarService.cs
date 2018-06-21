using MVP.Models;
using MVP.Models.Entities;
using MVP.Calendar;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace MVP.Services
{
    public class CalendarService
    {
        public CalendarDTO GetInitialData()
        {
            var result = new CalendarDTO();

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

        public List<DaySlot> GetDaySlots(CalendarDTO state, DateTime startdate, DateTime enddate)
        {
            var result = new List<DaySlot>();
            var date = startdate;

            using (var model = new EntityModel())
            {
                var capacity = model.Settings.Select(s => s.VehicleCapacity).First();

                while (date <= enddate)
                {
                    if (date >= DateTime.Today)
                    {
                        result.Add(GetDay(state, date, model, capacity));
                    }
                    else
                    {
                        result.Add(new DaySlot { Day = date, Status = SlotStatus.NONE, Price = 0 });
                    }
                    date = date + TimeSpan.FromDays(1);
                }
            }

            return result;
        }

        public DaySlot GetDay(CalendarDTO state, DateTime date)
        {
            using (var model = new EntityModel())
            {
                return GetDay(state, date, model, model.Settings.Select(s => s.VehicleCapacity).First());
            }
        }

        private DaySlot GetDay(CalendarDTO state, DateTime date, EntityModel model, int capacity)
        {
            var result = new DaySlot
            {
                Day = date,
                Status = SlotStatus.NONE,
                Price = 0
            };

            bool lastminute = Math.Ceiling((date - DateTime.Today).TotalDays) < model.Settings.Select(s => s.LastMinuteThreshold).First();
            var dayType = GetDayType(date);
            var departures = model.Departure.Where(d => d.Route.RouteId == state.Selection.Route.RouteId && d.DayType == dayType)
                .GroupJoin(model.Trip.Where(t => DbFunctions.TruncateTime(t.StartTime) == date).Include(t => t.Bookings),
                    d => d,
                    t => t.Departure,
                    (d, ts) => new { Departure = d, Occupancy = ts.Select(t => t.Bookings.Sum(b => b.Seats)).FirstOrDefault() }
                );

            if (!departures.Any())
            {
                return result;
            }

            if (!departures.Where(d => d.Occupancy < capacity).Any())
            {
                result.Status = SlotStatus.BLACK;
            }
            else
            {
                double ocup = (double)departures.Max(d => d.Occupancy) / (double)capacity;
                if (ocup > 0.5)
                {
                    result.Status = SlotStatus.RED;
                }
                else if (ocup > 0.25)
                {
                    result.Status = SlotStatus.YELLOW;
                }
                else if (ocup == 0 && lastminute)
                {
                    result.Status = SlotStatus.NONE;
                }
                else
                {
                    result.Status = SlotStatus.GREEN;
                }
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

        public List<APGroup> GetTimeSlots(CalendarDTO state)
        {
            using (var model = new EntityModel())
            {
                var result = new List<APGroup>();
                bool lastminute = Math.Ceiling((state.Selection.Date - DateTime.Today).TotalDays) < model.Settings.Select(s => s.LastMinuteThreshold).First();

                var date = state.Selection.Date;
                var dayType = GetDayType(date);

                //if (lastminute)
                //{
                //    departures = model.Trip.Where(t => DbFunctions.TruncateTime(t.StartTime) == date && t.Bookings.Sum(b => b.Seats) < (model.Settings.FirstOrDefault().VehicleCapacity - state.Selection.Seats)).ToList();
                //}
                //else
                //{
                //    departures = model.Departure.Where(d => d.Route.RouteId == state.Selection.Route.RouteId && d.DayType == dayType)
                //                  .GroupJoin(model.Trip.Where(t => DbFunctions.TruncateTime(t.StartTime) == date &&
                //                                              t.Bookings.Sum(b => b.Seats) < (model.Settings.FirstOrDefault().VehicleCapacity - state.Selection.Seats)),
                //                    d => d,
                //                    t => t.Departure,
                //                    (d, ts) => new
                //                                    {
                //                                        Departure = d,
                //                                        StartAccessPoint = ts.Select(t => t.StartAccessPoint).First() ?? state.Selection.SAP,
                //                                        EndAccessPoint = ts.Select(t => t.EndAccessPoint).First() ?? state.Selection.DAP
                //                                    }
                //                    );
                //}

                var times = new List<TimeSlot>();
                foreach (Departure d in model.Departure.Where(d => d.Route.RouteId == state.Selection.Route.RouteId && d.DayType == dayType))
                {
                    times.Add(new TimeSlot
                    {
                        Time = d.Time,
                        Status = lastminute ? SlotStatus.RED : SlotStatus.GREEN
                    });
                }
                var apg = new APGroup
                {
                    StartAPName = state.Selection.SAP.Name,
                    EndAPName = state.Selection.DAP.Name,
                    Times = times.OrderBy(t => t.Time).ToList()
                };
                result.Add(apg);
                
                return result;
            }
        }

        public Booking CreateBooking(CalendarDTO state)
        {
            using (var model = new EntityModel())
            {
                var trip = new Trip();

                if (state.Selection.Trip == null)
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
                    Status = BookingStatus.PENDING,
                    CreationTime = DateTime.Now,
                    Trip = model.Trip.Single(t => t.TripId == trip.TripId),
                    Seats = state.Selection.Seats,
                    Cost = state.Selection.Seats * state.Selection.Price
                };
                model.Booking.Add(booking);
                model.SaveChanges();

                return booking;
            }
        }

        public void UpdateBooking(Guid id, BookingStatus status) 
        {
            using (var model = new EntityModel())
            {
                var booking = model.Booking.Include(t => t.Trip).SingleOrDefault(b => b.BookingId == id);

                if (booking != null)
                {
                    booking.Status = status;
                    model.SaveChanges();

                    UpdateTrip(booking.Trip.TripId);
                }
            }
        }

        public Trip CreateTrip(CalendarDTO state)
        {
            using (var model = new EntityModel())
            {
                DayType daytype = GetDayType(state.Selection.Date);
                var trip = new Trip()
                {
                    TripId = Guid.NewGuid(),
                    Status = TripStatus.PENDING,
                    StartTime = state.Selection.Date + state.Selection.Time,
                    Departure = model.Departure.Where(r => r.Route.RouteId == state.Selection.Route.RouteId)
                                               .Where(dt => dt.DayType == daytype)
                                               .Where(t => t.Time == state.Selection.Time).First(),
                    StartAccessPoint = model.AccessPoint.Single(ap => ap.AccessPointId == state.Selection.SAP.AccessPointId),
                    EndAccessPoint = model.AccessPoint.Single(ap => ap.AccessPointId == state.Selection.DAP.AccessPointId)
                };
                model.Trip.Add(trip);
                model.SaveChanges();
                return trip;
            }
        }

        public void UpdateTrip(Guid id)
        {
            using (var model = new EntityModel())
            {
                var trip = model.Trip.Include(b => b.Bookings).SingleOrDefault(t => t.TripId == id);
                var bookings = trip.Bookings;

                if (trip == null || trip.Status == TripStatus.CANCELLED || trip.Status == TripStatus.COMPLETED)
                {
                    return;
                }

                if (trip.StartTime < DateTime.Now)
                {
                    trip.Status = TripStatus.COMPLETED;
                    foreach (Booking b in bookings.Where(s => s.Status == BookingStatus.BOOKED))
                    {
                        b.Status = BookingStatus.COMPLETED;
                    }
                    model.SaveChanges();
                    return;
                }

                if (trip.Status == TripStatus.PENDING)
                {
                    if (bookings.Where(s => s.Status == BookingStatus.BOOKED).Count() > 0)
                    {
                        trip.Status = TripStatus.BOOKED;
                        model.SaveChanges();
                        return;
                    }

                    if (bookings.Where(s => s.Status == BookingStatus.PENDING).Count() == 0)
                    {
                        trip.Status = TripStatus.CANCELLED;
                        model.SaveChanges();
                        return;
                    }
                }
            }
        }
    }
}
