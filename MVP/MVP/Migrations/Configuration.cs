using MVP.Models.Entities;
using System;
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
            LoopedRegion lr1 = new LoopedRegion() { LoopedRegionId = Guid.NewGuid(), Name = "Lisboa" };
            LoopedRegion lr2 = new LoopedRegion() { LoopedRegionId = Guid.NewGuid(), Name = "Leiria" };

            context.LoopedRegion.Add(lr1);
            context.LoopedRegion.Add(lr2);

            context.AccessPoint.Add(new AccessPoint() { AccessPointId = Guid.NewGuid(), Name = "Marquês de Pombal", Region = lr1 });
            context.AccessPoint.Add(new AccessPoint() { AccessPointId = Guid.NewGuid(), Name = "Saldanha", Region = lr1 });
            context.AccessPoint.Add(new AccessPoint() { AccessPointId = Guid.NewGuid(), Name = "Fonte Luminosa", Region = lr2 });
            context.AccessPoint.Add(new AccessPoint() { AccessPointId = Guid.NewGuid(), Name = "Estádio Municipal", Region = lr2 });

            context.Route.Add(new Route() { RouteId = Guid.NewGuid(), StartRegion = lr1, EndRegion = lr2, Duration = new TimeSpan(1, 30, 0), MinStartTime = new TimeSpan(8, 0, 0), MaxEndTime = new TimeSpan(17, 30, 0), DepartureInterval = new TimeSpan(1, 0, 0) });
            context.Route.Add(new Route() { RouteId = Guid.NewGuid(), StartRegion = lr2, EndRegion = lr1, Duration = new TimeSpan(1, 30, 0), MinStartTime = new TimeSpan(9, 30, 0), MaxEndTime = new TimeSpan(19, 0, 0), DepartureInterval = new TimeSpan(1, 0, 0) });

            base.Seed(context);
        }
    }
}
