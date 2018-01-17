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
            Database.SetInitializer(new EntityModelInitializer());
        }

        public DbSet<LoopedRegion> LoopedRegion {get; set;}
        public DbSet<AccessPoint> AccessPoint { get; set; }
        public DbSet<AccessPointHost> AccessPointHost { get; set; }
        public DbSet<Route> Route { get; set; }
        public DbSet<Trip> Trip { get; set; }
        public DbSet<Vehicle> Vehicle { get; set; }
        public DbSet<Driver> Driver { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("public");
            base.OnModelCreating(modelBuilder);
        }
    }

    public class EntityModelInitializer : CreateDatabaseIfNotExists<EntityModel>
    {
        protected override void Seed(EntityModel context)
        {
            // Seed default records to database here for testing purposes

            Guid id1 = Guid.NewGuid();
            Guid id2 = Guid.NewGuid();

            context.LoopedRegion.Add(new LoopedRegion() { LoopedRegionId = id1, Name = "Lisboa" });
            context.LoopedRegion.Add(new LoopedRegion() { LoopedRegionId = id2, Name = "Leiria" });

            context.AccessPoint.Add(new AccessPoint() { Name = "Marquês de Pombal", Region = id1 });
            context.AccessPoint.Add(new AccessPoint() { Name = "Saldanha", Region = id1 });
            context.AccessPoint.Add(new AccessPoint() { Name = "Fonte Luminosa", Region = id2 });
            context.AccessPoint.Add(new AccessPoint() { Name = "Estádio Municipal", Region = id2 });

            context.Route.Add(new Route() { Name = "Lisboa-Leiria", StartRegion = id1, EndRegion = id2, Duration = new TimeSpan(1, 30, 0), MinStartTime = new TimeSpan(8, 0, 0), MaxEndTime = new TimeSpan(17, 30, 0) });
            context.Route.Add(new Route() { Name = "Leiria-Lisboa", StartRegion = id2, EndRegion = id1, Duration = new TimeSpan(1, 30, 0), MinStartTime = new TimeSpan(9, 30, 0), MaxEndTime = new TimeSpan(19, 0, 0) });

            base.Seed(context);
        }
    }
}