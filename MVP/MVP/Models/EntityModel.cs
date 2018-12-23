using MVP.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MVP.Models
{
    public class EntityModel : ApplicationDbContext
    {
        public DbSet<Settings> Settings { get; set; }
        public DbSet<UpdateService> UpdateService { get; set; }
        public DbSet<LoopedRegion> LoopedRegion {get; set;}
        public DbSet<AccessPoint> AccessPoint { get; set; }
        public DbSet<AccessPointHost> AccessPointHost { get; set; }
        public DbSet<Route> Route { get; set; }
            public DbSet<Departure> Departure { get; set; }
            public DbSet<Fare> Fare { get; set; }
        public DbSet<Booking> Booking { get; set; }
        public DbSet<Trip> Trip { get; set; }
        public DbSet<Vehicle> Vehicle { get; set; }
            public DbSet<Vehicle.VehicleAvailability> VehicleAvailability { get; set; }
        public DbSet<Driver> Driver { get; set; }
            public DbSet<Driver.DriverAvailability> DriverAvailability { get; set; }
        public DbSet<Promocode> Promocode { get; set; }
        public DbSet<Corporate> Corporate { get; set; }
        public DbSet<Dates> Dates { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("public");
            base.OnModelCreating(modelBuilder);
        }
    }
}
