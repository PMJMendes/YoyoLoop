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
        public EntityModel()
        {

        }

        DbSet<LoopedRegion> LoopedRegion {get; set;}
        DbSet<AccessPoint> AccessPoint { get; set; }
        DbSet<AccessPointHost> AccessPointHost { get; set; }
        DbSet<Route> Route { get; set; }
        DbSet<Trip> Trip { get; set; }
        DbSet<Vehicle> Vehicle { get; set; }
        DbSet<Driver> Driver { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("public");
            base.OnModelCreating(modelBuilder);
        }
    }

}