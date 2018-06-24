using MVP.Models;
using MVP.Models.Entities;
using MVP.Calendar;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace MVP.Services
{
    public class CalendarService
    {
        public static object Booking_Lock = new object();

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
                                               DepartureId = Guid.Empty
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
                .GroupJoin(model.Trip.Where(t => t.Status != TripStatus.CANCELLED && DbFunctions.TruncateTime(t.StartTime) == date),
                    d => d,
                    t => t.Departure,
                    (d, ts) => new { Departure = d, Occupancy = ts.Select(t => t.Bookings.Where(b => b.Status != BookingStatus.CANCELLED).Sum(b => b.Seats)).FirstOrDefault() }
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
            var date = state.Selection.Date;

            using (var model = new EntityModel())
            {
                int capacity = model.Settings.Select(s => s.VehicleCapacity).First();
                bool lastminute = Math.Ceiling((date - DateTime.Today).TotalDays) < model.Settings.Select(s => s.LastMinuteThreshold).First();
                var dayType = GetDayType(date);

                var departures = model.Departure.Where(d => d.Route.RouteId == state.Selection.Route.RouteId && d.DayType == dayType)
                    .GroupJoin(model.Trip.Where(t => t.Status != TripStatus.CANCELLED && DbFunctions.TruncateTime(t.StartTime) == date),
                        d => d,
                        t => t.Departure,
                        (d, ts) => new { Departure = d, Trips = ts }
                    );

                var tripGroups = departures.SelectMany(
                        d => d.Trips.DefaultIfEmpty(),
                        (d, t) => new
                        {
                            APs = new
                            {
                                SAP = t == null ? model.AccessPoint.Where(ap => ap.AccessPointId == state.Selection.SAP.AccessPointId).FirstOrDefault() : t.StartAccessPoint,
                                DAP = t == null ? model.AccessPoint.Where(ap => ap.AccessPointId == state.Selection.DAP.AccessPointId).FirstOrDefault() : t.EndAccessPoint
                            },
                            Occupancy = t == null ? 0 : t.Bookings.Where(b => b.Status != BookingStatus.CANCELLED).Sum(b => b.Seats),
                            Departure = d.Departure
                        }
                    ).GroupBy(t => t.APs).OrderByDescending(t => (t.Key.SAP.AccessPointId == state.Selection.SAP.AccessPointId) && (t.Key.DAP.AccessPointId == state.Selection.DAP.AccessPointId)).ToList();

                return tripGroups.Select(d => new APGroup
                {
                    StartAPName = d.Key.SAP.Name,
                    EndAPName = d.Key.DAP.Name,
                    Times = d.Select(dt => new TimeSlot {
                        Departure = dt.Departure,
                        Status = dt.Occupancy + state.Selection.Seats > capacity ? SlotStatus.BLACK :
                            dt.Occupancy > (double)capacity * 0.5 ? SlotStatus.RED :
                            dt.Occupancy > (double)capacity * 0.25 ? SlotStatus.YELLOW :
                            lastminute && dt.Occupancy == 0 ? SlotStatus.NONE :
                            SlotStatus.GREEN
                    }).OrderBy(ts => ts.Departure.Time).ToList()
                }).ToList();
            }
        }

        public void CheckPending()
        {
            using (var model = new EntityModel())
            {
                TimeSpan timeout = model.Settings.Select(s => s.BookTimeout).First();
                foreach (Booking b in model.Booking.Where(b => b.Status == BookingStatus.PENDING))
                {
                    if(DateTime.Now - b.CreationTime > timeout)
                    {
                        UpdateBooking(b.BookingId, BookingStatus.CANCELLED);
                    }
                }
            }
        }

        public Booking CreateBooking(CalendarDTO state)
        {
            using (var model = new EntityModel())
            {
                int capacity = model.Settings.Select(s => s.VehicleCapacity).First();
                var starttime = state.Selection.Date + state.Selection.Time; // EF doesn't support Arithmetics with DateTime - mindboggling

                var booking = new Booking()
                {
                    BookingId = Guid.NewGuid(),
                    Status = BookingStatus.PENDING,
                    UserId = HttpContext.Current.User.Identity.GetUserId(),
                    CreationTime = DateTime.Now,
                    Seats = state.Selection.Seats,
                    Cost = state.Selection.Seats * state.Selection.Price
                };

                lock (Booking_Lock)
                {
                    var trip = model.Trip.Include(b => b.Bookings).FirstOrDefault(t => t.Status != TripStatus.CANCELLED && t.Departure.DepartureId == state.Selection.DepartureId);

                    if (trip == null)
                    {
                        trip = CreateTrip(state, model);
                        model.Trip.Add(trip);
                    }
                    else if (trip.Bookings.Where(b => b.Status != BookingStatus.CANCELLED).Sum(b => b.Seats) + state.Selection.Seats > capacity)
                    {
                        return null;
                    }

                    booking.Trip = trip;

                    model.Booking.Add(booking);
                    model.SaveChanges();

                    return booking;
                }
            }
        }

        private Trip CreateTrip(CalendarDTO state, EntityModel model)
        {
            DayType daytype = GetDayType(state.Selection.Date);
            return new Trip
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
        }

        private void UpdateBooking(Guid id, BookingStatus status)
        {
            using (var model = new EntityModel())
            {
                var booking = model.Booking.Include(t => t.Trip).SingleOrDefault(b => b.BookingId == id);

                if (booking != null)
                {
                    booking.Status = status;
                    model.SaveChanges();

                    UpdateTrip(booking.Trip.TripId, model);
                }
            }
        }

        private void UpdateTrip(Guid id, EntityModel model)
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
                if (bookings.Where(s => s.Status == BookingStatus.BOOKED).Any())
                {
                    trip.Status = TripStatus.BOOKED;
                    model.SaveChanges();
                    return;
                }

                if (!bookings.Where(s => s.Status == BookingStatus.PENDING).Any())
                {
                    trip.Status = TripStatus.CANCELLED;
                    model.SaveChanges();
                    return;
                }
            }
        }
    }
}
