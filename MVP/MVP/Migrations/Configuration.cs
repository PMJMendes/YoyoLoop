using MVP.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;

namespace MVP.Migrations
{
    internal sealed class Configuration : DbMigrationsConfiguration<MVP.Models.EntityModel>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(MVP.Models.EntityModel context)
        {
            context.UpdateService.AddOrUpdate(new Models.Entities.UpdateService()
            {
                UpdateServiceId = Guid.Parse("DBD2C631-05E6-43EC-B86C-34B03A283906"),
                LastRun = DateTime.Now,
                LastDaily = DateTime.Today,
                WarningThreshold = new TimeSpan(0, 30, 0),
                Warning = false
            });

            context.Settings.AddOrUpdate(new Settings()
            {
                SettingsId = Guid.Parse("0771CC70-AF4A-452B-AE8F-F96314C31C55"),
                BookTimeout = new TimeSpan (0, 10, 0),
                VehicleCapacity = 5,
                LastMinuteThreshold = 2,
                MinTimeBookLastMinute = new TimeSpan (0, 15, 0)
            });


            base.Seed(context);
        }
    }
}
