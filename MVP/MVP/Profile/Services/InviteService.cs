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
                    AmountSaved = "0",
                    MGMTrips = "0",
                    MGMCode = "#mypromocode"
                };
                return result;
            }
        }

        public int GetUserMGM(string userid)
        {
            using (var model = new EntityModel())
            {
                var user = model.Users.FirstOrDefault(u => u.Id == userid);

                int referrals = model.Users.Where(u => u.ReferredBy.Id == user.Id).Count();
                if (user.ReferredBy == user)
                {
                    referrals--;
                }

                int uses = model.Booking.Where(b => b.UserId == user.Id && b.MGM && (b.Status == BookingStatus.BOOKED || b.Status == BookingStatus.COMPLETED)).Count();
                if (user.ReferredBy != user && user.ReferredBy != null)
                {
                    uses--;
                }

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