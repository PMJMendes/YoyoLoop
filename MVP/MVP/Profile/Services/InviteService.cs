using MVP.Models;
using MVP.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVP.Profile.Services
{
    public class InviteService
    {
        public InviteDTO GetInitialData(string userid)
        {
            using (var model = new EntityModel())
            {
                var user = model.Users.FirstOrDefault(u => u.Id == userid);
                var result = new InviteDTO
                {
                    UserId = user.Id,
                    AmountSaved = GetAmountSaved(userid),
                    MGMTrips = GetUserMGM(userid),
                    UserMGMCode = user.MGMCode
                };
                return result;
            }
        }

        private int GetAmountSaved (string userid)
        {
            using (var model = new EntityModel())
            {
                var mgmbookings = model.Booking.Where(b => b.UserId == userid && b.MGM && (b.Status == BookingStatus.BOOKED || b.Status == BookingStatus.COMPLETED));

                if(mgmbookings.Any())
                {
                    var normalcost = mgmbookings.Sum(b => b.Trip.Departure.Route.Fares.Where(f => f.Type == b.FareType).FirstOrDefault().Price);
                    var mgmcost = mgmbookings.Sum(b => b.Trip.Departure.Route.Fares.Where(f => f.Type == Fare.FareType.MEMBERGETMEMBER).FirstOrDefault().Price);

                    return (int)(normalcost - mgmcost);
                }
                else
                {
                    return 0;
                }
            }
        }
        public int GetUserMGM(string userid)
        {
            using (var model = new EntityModel())
            {
                var user = model.Users.FirstOrDefault(u => u.Id == userid);

                int referrals = model.Users.Where(u => (u.Id != user.Id) && (u.ReferredBy.Id == user.Id)).Count();
                if (user.ReferredBy != user && user.ReferredBy != null)
                {
                    referrals++;
                }

                int uses = model.Booking.Where(b => b.UserId == user.Id && b.MGM && (b.Status == BookingStatus.BOOKED || b.Status == BookingStatus.COMPLETED)).Count();

                int mgms = referrals - uses;
                if (mgms > 0)
                {
                    return mgms;
                }
                else
                {
                    return 0;
                }
            }
        }
    }
}