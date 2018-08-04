using MVP.Models;
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
    }
}