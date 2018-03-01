namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ModelReworkWireframeApproval : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "public.Bookings",
                c => new
                    {
                        BookingId = c.Guid(nullable: false),
                        Status = c.Int(nullable: false),
                        CreationTime = c.DateTime(nullable: false),
                        Seats = c.Int(nullable: false),
                        Cost = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Trip_TripId = c.Guid(),
                    })
                .PrimaryKey(t => t.BookingId)
                .ForeignKey("public.Trips", t => t.Trip_TripId)
                .Index(t => t.Trip_TripId);
            
            CreateTable(
                "public.DriverAvailabilities",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        DayOfWeek = c.Int(nullable: false),
                        StartTime = c.Time(nullable: false, precision: 6),
                        EndTime = c.Time(nullable: false, precision: 6),
                        Driver_DriverId = c.Guid(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("public.Drivers", t => t.Driver_DriverId)
                .Index(t => t.Driver_DriverId);
            
            CreateTable(
                "public.VehicleAvailabilities",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        DayOfWeek = c.Int(nullable: false),
                        StartTime = c.Time(nullable: false, precision: 6),
                        EndTime = c.Time(nullable: false, precision: 6),
                        Vehicle_VehicleId = c.Guid(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("public.Vehicles", t => t.Vehicle_VehicleId)
                .Index(t => t.Vehicle_VehicleId);
            
            CreateTable(
                "public.Departures",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Day = c.Int(nullable: false),
                        Time = c.Time(nullable: false, precision: 6),
                        Route_RouteId = c.Guid(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("public.Routes", t => t.Route_RouteId)
                .Index(t => t.Route_RouteId);
            
            CreateTable(
                "public.Settings",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        BookTimeout = c.Time(nullable: false, precision: 6),
                        MemberGetMemberPrice = c.Decimal(nullable: false, precision: 18, scale: 2),
                        VehicleCapacity = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("public.AccessPoints", "Active", c => c.Boolean(nullable: false));
            AddColumn("public.AccessPoints", "GoogleLocation", c => c.String());
            AddColumn("public.LoopedRegions", "Active", c => c.Boolean(nullable: false));
            AddColumn("public.Drivers", "Active", c => c.Boolean(nullable: false));
            AddColumn("public.Routes", "Active", c => c.Boolean(nullable: false));
            AddColumn("public.Trips", "Status", c => c.Int(nullable: false));
            AddColumn("public.Trips", "Duration", c => c.Time(nullable: false, precision: 6));
            AddColumn("public.Trips", "Driver_DriverId", c => c.Guid());
            AddColumn("public.Trips", "Vehicle_VehicleId", c => c.Guid());
            AddColumn("public.Vehicles", "Active", c => c.Boolean(nullable: false));
            AddColumn("public.Vehicles", "Plate", c => c.String());
            AddColumn("public.Vehicles", "Capacity", c => c.Int(nullable: false));
            CreateIndex("public.Trips", "Driver_DriverId");
            CreateIndex("public.Trips", "Vehicle_VehicleId");
            AddForeignKey("public.Trips", "Driver_DriverId", "public.Drivers", "DriverId");
            AddForeignKey("public.Trips", "Vehicle_VehicleId", "public.Vehicles", "VehicleId");
            DropColumn("public.Routes", "MinStartTime");
            DropColumn("public.Routes", "MaxEndTime");
            DropColumn("public.Routes", "DepartureInterval");
            DropColumn("public.Trips", "EndTime");
        }
        
        public override void Down()
        {
            AddColumn("public.Trips", "EndTime", c => c.DateTime(nullable: false));
            AddColumn("public.Routes", "DepartureInterval", c => c.Time(nullable: false, precision: 6));
            AddColumn("public.Routes", "MaxEndTime", c => c.Time(nullable: false, precision: 6));
            AddColumn("public.Routes", "MinStartTime", c => c.Time(nullable: false, precision: 6));
            DropForeignKey("public.Departures", "Route_RouteId", "public.Routes");
            DropForeignKey("public.Trips", "Vehicle_VehicleId", "public.Vehicles");
            DropForeignKey("public.VehicleAvailabilities", "Vehicle_VehicleId", "public.Vehicles");
            DropForeignKey("public.Trips", "Driver_DriverId", "public.Drivers");
            DropForeignKey("public.DriverAvailabilities", "Driver_DriverId", "public.Drivers");
            DropForeignKey("public.Bookings", "Trip_TripId", "public.Trips");
            DropIndex("public.Departures", new[] { "Route_RouteId" });
            DropIndex("public.VehicleAvailabilities", new[] { "Vehicle_VehicleId" });
            DropIndex("public.DriverAvailabilities", new[] { "Driver_DriverId" });
            DropIndex("public.Trips", new[] { "Vehicle_VehicleId" });
            DropIndex("public.Trips", new[] { "Driver_DriverId" });
            DropIndex("public.Bookings", new[] { "Trip_TripId" });
            DropColumn("public.Vehicles", "Capacity");
            DropColumn("public.Vehicles", "Plate");
            DropColumn("public.Vehicles", "Active");
            DropColumn("public.Trips", "Vehicle_VehicleId");
            DropColumn("public.Trips", "Driver_DriverId");
            DropColumn("public.Trips", "Duration");
            DropColumn("public.Trips", "Status");
            DropColumn("public.Routes", "Active");
            DropColumn("public.Drivers", "Active");
            DropColumn("public.LoopedRegions", "Active");
            DropColumn("public.AccessPoints", "GoogleLocation");
            DropColumn("public.AccessPoints", "Active");
            DropTable("public.Settings");
            DropTable("public.Departures");
            DropTable("public.VehicleAvailabilities");
            DropTable("public.DriverAvailabilities");
            DropTable("public.Bookings");
        }
    }
}
