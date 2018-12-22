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
using MVP.Controls;
using MVP.Profile.Services;
using MVP.Models.Helpers;

namespace MVP.Services
{
    public class CalendarService
    {
        private readonly CheckoutService checkoutService = new CheckoutService();
        private readonly InviteService inviteService = new InviteService();
        public static object Booking_Lock = new object();

        public CalendarDTO GetInitialData(string userid)
        {
            var result = new CalendarDTO();

            result.UserId = userid;
            if(!string.IsNullOrEmpty(userid))
            {
                result.UserMGM = inviteService.GetUserMGM(userid) > 0 ? true : false;
            }
            else
            {
                result.UserMGM = false;
            }

            using (var model = new EntityModel())
            {
                result.Routes = model.Route.Where(r => r.Active)
                                           .Include(r => r.StartRegion.AccessPoints)
                                           .Include(r => r.EndRegion.AccessPoints)
                                           .Include(d => d.Departures)
                                           .Include(f => f.Fares)
                                           .ToList();
            }

            result.Selection = new Selection { Date = new DateTime(),
                                               Route = null,
                                               SAP = null,
                                               DAP = null,
                                               Time = new TimeSpan(),
                                               Promocode = string.Empty,
                                               FareType = Fare.FareType.STANDARD,
                                               Seats = 1,
                                               DepartureId = Guid.Empty
                                              };

            result.DaySlots = new List<DaySlot>();

            return result;
        }

        public int GetCapacity()
        {
            using (var model = new EntityModel())
            {
                var capacity = model.Settings.Select(s => s.VehicleCapacity).First();
                return capacity;
            }
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
                        result.Add(new DaySlot { Day = date, Status = SlotStatus.NONE, FareType = Fare.FareType.STANDARD, Price = 0 });
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
                FareType = Fare.FareType.STANDARD,
                Price = 0
            };

            bool lastminute = Math.Ceiling((date - DateTime.Today).TotalDays) < model.Settings.Select(s => s.LastMinuteThreshold).First();
            var threshold = DateTime.Now.TimeOfDay + model.Settings.Select(s => s.MinTimeBookLastMinute).First();
            var seats = state.Selection.Seats;
            var dayType = GetDayType(date);
            var departures = model.Departure.Where(d => d.Active && d.Route.RouteId == state.Selection.Route.RouteId && d.DayType == dayType)
                .GroupJoin(model.Trip.Where(t => t.Status != TripStatus.CANCELLED && DbFunctions.TruncateTime(t.StartTime) == date),
                    d => d,
                    t => t.Departure,
                    (d, ts) => new { Departure = d, Occupancy = ts.Select(t => t.Bookings.Where(b => b.Status != BookingStatus.CANCELLED).Sum(b => b.Seats)).FirstOrDefault() }
                );

            if (!departures.Any())
            {
                return result;
            }

            double ocup = (double)departures.Max(d => d.Occupancy) / (double)capacity;

            if(lastminute && ocup == 0)
            {
                result.Status = SlotStatus.NONE;
            }
            else if (lastminute && !departures.Where(d => d.Occupancy > 0 && (d.Occupancy + seats) <= capacity).Any())
            {
                result.Status = SlotStatus.BLACK;
            }
            else if (date == DateTime.Today && !departures.Where(d => d.Departure.Time > threshold).Any())
            {
                result.Status = SlotStatus.NONE;
            }
            else if (!departures.Where(d => (d.Occupancy + seats) <= capacity).Any())
            {
                result.Status = SlotStatus.BLACK;
            }
            else
            {
                if (ocup > 0.5)
                {
                    result.Status = SlotStatus.RED;
                }
                else if (ocup > 0.25)
                {
                    result.Status = SlotStatus.YELLOW;
                }
                else
                {
                    result.Status = SlotStatus.GREEN;
                }
            }

            if (lastminute)
            {
                result.FareType = Fare.FareType.LASTMINUTE;
                result.Price = state.Selection.Route.Fares.Where(ft => ft.Type == Fare.FareType.LASTMINUTE).Select(p => p.Price).FirstOrDefault();
            }
            else
            {
                result.FareType = Fare.FareType.STANDARD;
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
                var threshold = DateTime.Now + model.Settings.Select(s => s.MinTimeBookLastMinute).First();

                var dayType = GetDayType(date);

                var departures = model.Departure.Where(d => d.Active && d.Route.RouteId == state.Selection.Route.RouteId && d.DayType == dayType)
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
                                SAP = t == null ? model.AccessPoint.Where(ap => ap.Active && ap.AccessPointId == state.Selection.SAP.AccessPointId).FirstOrDefault() : t.StartAccessPoint,
                                DAP = t == null ? model.AccessPoint.Where(ap => ap.Active && ap.AccessPointId == state.Selection.DAP.AccessPointId).FirstOrDefault() : t.EndAccessPoint
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
                        Status = lastminute && dt.Occupancy == 0 ? SlotStatus.NONE :
                                 date + dt.Departure.Time < threshold ? SlotStatus.NONE :
                                 dt.Occupancy + state.Selection.Seats > capacity ? SlotStatus.BLACK :
                                 dt.Occupancy > (double)capacity * 0.5 ? SlotStatus.RED :
                                 dt.Occupancy > (double)capacity * 0.25 ? SlotStatus.YELLOW :
                                 SlotStatus.GREEN
                    }).OrderBy(ts => ts.Departure.Time).ToList()
                }).ToList();
            }
        }

        public CalendarDTO CheckPromo(CalendarDTO state, out MasterService.ErrorCode error)
        {
            error = MasterService.ErrorCode.OK;
            using (var model = new EntityModel())
            {
                bool lastminute = Math.Ceiling((state.Selection.Date - DateTime.Today).TotalDays) < model.Settings.Select(s => s.LastMinuteThreshold).First();

                if(string.IsNullOrEmpty(state.Selection.Promocode))
                {
                    state.Selection.MGM = false;
                    state.Selection.FareType = lastminute ? Fare.FareType.LASTMINUTE : Fare.FareType.STANDARD;
                }
                else
                {
                    if (model.Users.Any(u => u.MGMCode == state.Selection.Promocode))
                    {
                        if(string.IsNullOrEmpty(state.UserId))
                        {
                            state.Selection.MGM = true;
                        }
                        else
                        {
                            if(model.Users.Include(u => u.ReferredBy).FirstOrDefault(u => u.Id == state.UserId).ReferredBy == null)
                            {
                                string phone = model.Users.FirstOrDefault(u => u.Id == state.UserId).PhoneNumber;
                                if (!string.IsNullOrEmpty(phone))
                                {
                                    state.Selection.MGM = true;
                                }
                                else
                                {
                                    state.Selection.MGM = false;
                                    error = MasterService.ErrorCode.NOPHONE;
                                }
                            }
                            else
                            {
                                state.Selection.MGM = false;
                            }
                        }
                    }
                    else
                    {
                        state.Selection.MGM = false;
                        if (model.Promocode.Any(p => p.Active && p.StartDate <= DateTime.Today && p.EndDate >= DateTime.Today && p.Code.ToUpper() == state.Selection.Promocode))
                        {
                            state.Selection.FareType = model.Promocode.FirstOrDefault(p => p.Code.ToUpper() == state.Selection.Promocode).FareType;
                        }
                        else
                        {
                            state.Selection.FareType = lastminute ? Fare.FareType.LASTMINUTE : Fare.FareType.STANDARD;
                        }
                    }
                }
            }
            return state;
        }

        public BookingPanelDTO GetBookingPanelData(CalendarDTO state, string trigger)
        {
            var starttime = state.Selection.Date + state.Selection.Time;
            var dayType = GetDayType(state.Selection.Date);

            using (var model = new EntityModel())
            {
                int capacity = model.Settings.Select(s => s.VehicleCapacity).First();
                bool lastminute = Math.Ceiling((state.Selection.Date - DateTime.Today).TotalDays) < model.Settings.Select(s => s.LastMinuteThreshold).First();
                var threshold = DateTime.Now + model.Settings.Select(s => s.MinTimeBookLastMinute).First();

                var departures = model.Departure.Where(d => d.Active &&
                                                            d.Route.RouteId == state.Selection.Route.RouteId &&
                                                            d.DayType == dayType &&
                                                            d.Time == state.Selection.Time
                                                       )
                    .GroupJoin(model.Trip.Include(t => t.Bookings)
                                         .Include(t => t.Departure).Where(t => (t.Status == TripStatus.PENDING || t.Status == TripStatus.BOOKED) &&
                                                                                t.Departure.Route.RouteId == state.Selection.Route.RouteId &&
                                                                                t.StartTime == starttime 
                                                                                ),
                        d => d,
                        t => t.Departure,
                        (d, ts) => new { Departure = d, Trips = ts }
                    );

                var result = new BookingPanelDTO
                {
                    Trigger = trigger,
                    Seats = state.Selection.Seats,
                    FareType = state.Selection.FareType,
                    StandardPrice = model.Route.Include(r => r.Fares).FirstOrDefault(r => r.RouteId == state.Selection.Route.RouteId).Fares.FirstOrDefault(f => f.Type == (lastminute ? Fare.FareType.LASTMINUTE : Fare.FareType.STANDARD)).Price,
                    Price = model.Route.Include(r => r.Fares).FirstOrDefault(r => r.RouteId == state.Selection.Route.RouteId).Fares.FirstOrDefault(f => f.Type == state.Selection.FareType).Price,
                    Promocode = state.Selection.Promocode,
                    PromoValid = (int)state.Selection.FareType >= (int)Fare.FareType.PROMOTIONAL ? true : false,
                    MGM = state.Selection.MGM,
                    UserMGM = state.UserMGM,
                    MGMPrice = model.Route.Include(r => r.Fares).FirstOrDefault(r => r.RouteId == state.Selection.Route.RouteId).Fares.FirstOrDefault(f => f.Type == Fare.FareType.MEMBERGETMEMBER).Price,
                    StartTime = starttime,
                    ArrivalTime = starttime +
                                  (state.Selection.Route?.Duration ?? TimeSpan.Zero) +
                                  (model.Departure.FirstOrDefault(d => d.Active && d.Route.RouteId == state.Selection.Route.RouteId && d.DayType == dayType && d.Time == state.Selection.Time)?.DurationModifier ?? TimeSpan.Zero) +
                                  (state.Selection.SAP?.DurationModifier ?? TimeSpan.Zero) +
                                  (state.Selection.DAP?.DurationModifier ?? TimeSpan.Zero),
                    StartRegionName = state.Selection.Route.StartRegion.Name,
                    StartAPName = state.Selection.SAP.Name,
                    EndRegionName = state.Selection.Route.EndRegion.Name,
                    EndAPName = state.Selection.DAP.Name
                };


                result.StandardCost = result.StandardPrice * result.Seats;
                result.Cost = result.MGM || result.UserMGM ? result.MGMPrice + (result.Price * (result.Seats - 1)) : result.Price * result.Seats;
                result.PriceSummary = checkoutService.GetPriceSummary(result);

                if(trigger == "new")
                {
                    result.BookingValid = true;
                }
                else
                {
                    var tripsvalid = departures.Any(d => d.Trips.Any(t => t.StartTime >= threshold &&
                                                                          t.StartAccessPoint.AccessPointId == state.Selection.SAP.AccessPointId &&
                                                                          t.EndAccessPoint.AccessPointId == state.Selection.DAP.AccessPointId &&
                                                                          t.Bookings.Where(b => b.Status != BookingStatus.CANCELLED).Sum(b => b.Seats) + state.Selection.Seats <= capacity));
                    if (lastminute)
                    {
                        result.BookingValid = tripsvalid;
                    }
                    else
                    {
                        result.BookingValid = departures.Any(d => !d.Trips.Any()) || tripsvalid;
                                              
                    }
                }

                return result;
            }
        }

        public void CheckPending(string user_id)
        {
            using (var model = new EntityModel())
            {
                TimeSpan timeout = model.Settings.Select(s => s.BookTimeout).First();
                foreach (Booking b in model.Booking.Where(b => b.Status == BookingStatus.PENDING))
                {
                    if(DateTime.Now - b.CreationTime > timeout || b.UserId == user_id)
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
                var threshold = DateTime.Now + model.Settings.Select(s => s.MinTimeBookLastMinute).First();

                var booking = new Booking()
                {
                    BookingId = Guid.NewGuid(),
                    Status = BookingStatus.PENDING,
                    UserId = HttpContext.Current.User.Identity.GetUserId(),
                    CreationTime = DateTime.Now,
                    Seats = state.Selection.Seats,
                    FareType = state.Selection.FareType,
                    Promocode = model.Promocode.FirstOrDefault(p => p.Code == state.Selection.Promocode),
                    MGM = state.UserMGM || state.Selection.MGM
                };

                var price = model.Route.Include(f => f.Fares).FirstOrDefault(r => r.RouteId == state.Selection.Route.RouteId).Fares.FirstOrDefault(f => f.Type == state.Selection.FareType).Price;
                var mgmprice = model.Route.Include(f => f.Fares).FirstOrDefault(r => r.RouteId == state.Selection.Route.RouteId).Fares.FirstOrDefault(f => f.Type == Fare.FareType.MEMBERGETMEMBER).Price;
                booking.Cost = state.Selection.MGM || state.UserMGM ? mgmprice + (price * (booking.Seats - 1)) : price * booking.Seats;

                lock (Booking_Lock)
                {
                    var trip = model.Trip.Include(b => b.Bookings).FirstOrDefault(t => t.Status != TripStatus.CANCELLED &&
                                                                                       t.Departure.DepartureId == state.Selection.DepartureId &&
                                                                                       t.StartTime == starttime);
                    if (trip == null)
                    {
                        trip = CreateTrip(state, model);
                        model.Trip.Add(trip);
                    }
                    else if (trip.Bookings.Where(b => b.Status != BookingStatus.CANCELLED).Sum(b => b.Seats) + state.Selection.Seats > capacity || trip.StartTime < threshold)
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
