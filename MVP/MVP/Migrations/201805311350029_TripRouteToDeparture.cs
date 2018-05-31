namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class TripRouteToDeparture : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("public.Trips", "Route_RouteId", "public.Routes");
            DropIndex("public.Trips", new[] { "Route_RouteId" });
            AddColumn("public.Trips", "Departure_DepartureId", c => c.Guid());
            CreateIndex("public.Trips", "Departure_DepartureId");
            AddForeignKey("public.Trips", "Departure_DepartureId", "public.Departures", "DepartureId");
            DropColumn("public.Trips", "Route_RouteId");
        }
        
        public override void Down()
        {
            AddColumn("public.Trips", "Route_RouteId", c => c.Guid());
            DropForeignKey("public.Trips", "Departure_DepartureId", "public.Departures");
            DropIndex("public.Trips", new[] { "Departure_DepartureId" });
            DropColumn("public.Trips", "Departure_DepartureId");
            CreateIndex("public.Trips", "Route_RouteId");
            AddForeignKey("public.Trips", "Route_RouteId", "public.Routes", "RouteId");
        }
    }
}
