namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ModelUpdateBuildCalendar : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.Trips", "Route_RouteId", c => c.Guid());
            AddColumn("public.DriverAvailabilities", "DayType", c => c.Int(nullable: false));
            AddColumn("public.VehicleAvailabilities", "DayType", c => c.Int(nullable: false));
            AddColumn("public.Departures", "DayType", c => c.Int(nullable: false));
            AddColumn("public.Routes", "StandardFare", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AddColumn("public.Routes", "LastMinuteFare", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AddColumn("public.Settings", "LastMinuteThreshold", c => c.Int(nullable: false));
            CreateIndex("public.Trips", "Route_RouteId");
            AddForeignKey("public.Trips", "Route_RouteId", "public.Routes", "RouteId");
            DropColumn("public.DriverAvailabilities", "DayOfWeek");
            DropColumn("public.VehicleAvailabilities", "DayOfWeek");
            DropColumn("public.Departures", "Day");
        }
        
        public override void Down()
        {
            AddColumn("public.Departures", "Day", c => c.Int(nullable: false));
            AddColumn("public.VehicleAvailabilities", "DayOfWeek", c => c.Int(nullable: false));
            AddColumn("public.DriverAvailabilities", "DayOfWeek", c => c.Int(nullable: false));
            DropForeignKey("public.Trips", "Route_RouteId", "public.Routes");
            DropIndex("public.Trips", new[] { "Route_RouteId" });
            DropColumn("public.Settings", "LastMinuteThreshold");
            DropColumn("public.Routes", "LastMinuteFare");
            DropColumn("public.Routes", "StandardFare");
            DropColumn("public.Departures", "DayType");
            DropColumn("public.VehicleAvailabilities", "DayType");
            DropColumn("public.DriverAvailabilities", "DayType");
            DropColumn("public.Trips", "Route_RouteId");
        }
    }
}
