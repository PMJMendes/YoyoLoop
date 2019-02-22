using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Net.Mail;
using System.Threading;
using System.Web;
using System.Web.Configuration;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using MVP.Models;
using MVP.Models.Entities;
using MVP.Models.Helpers;

namespace MVP.Services
{
    public class CityService
    {
        public List<LoopedRegion> GetCities()
        {
            using (var model = new EntityModel())
            {
                return model.LoopedRegion.Where(r => r.Active).ToList();
            }
        }

        public LoopedRegion GetCity(String city)
        {
            using (var model = new EntityModel())
            {
                return model.LoopedRegion.Where(r => r.Active && r.Name == city).FirstOrDefault();
            }
        }

        public List<AccessPoint> GetCityLoops(String city)
        {
            using (var model = new EntityModel())
            {
                return model.AccessPoint.Where(ap => ap.Active && ap.Region.Name == city).ToList();
            }
        }
    }
}
