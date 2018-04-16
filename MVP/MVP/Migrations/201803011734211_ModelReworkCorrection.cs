namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ModelReworkCorrection : DbMigration
    {
        public override void Up()
        {
            DropPrimaryKey("public.DriverAvailabilities");
            DropPrimaryKey("public.VehicleAvailabilities");
            DropPrimaryKey("public.Departures");
            AddColumn("public.DriverAvailabilities", "DriverAvailabilityId", c => c.Guid(nullable: false));
            AddColumn("public.Vehicles", "LicensePlate", c => c.String());
            AddColumn("public.VehicleAvailabilities", "VehicleAvailabilityId", c => c.Guid(nullable: false));
            AddColumn("public.Departures", "DepartureId", c => c.Guid(nullable: false));
            AddPrimaryKey("public.DriverAvailabilities", "DriverAvailabilityId");
            AddPrimaryKey("public.VehicleAvailabilities", "VehicleAvailabilityId");
            AddPrimaryKey("public.Departures", "DepartureId");
            DropColumn("public.DriverAvailabilities", "Id");
            DropColumn("public.Vehicles", "Plate");
            DropColumn("public.VehicleAvailabilities", "Id");
            DropColumn("public.Departures", "Id");
        }
        
        public override void Down()
        {
            AddColumn("public.Departures", "Id", c => c.Int(nullable: false, identity: true));
            AddColumn("public.VehicleAvailabilities", "Id", c => c.Int(nullable: false, identity: true));
            AddColumn("public.Vehicles", "Plate", c => c.String());
            AddColumn("public.DriverAvailabilities", "Id", c => c.Int(nullable: false, identity: true));
            DropPrimaryKey("public.Departures");
            DropPrimaryKey("public.VehicleAvailabilities");
            DropPrimaryKey("public.DriverAvailabilities");
            DropColumn("public.Departures", "DepartureId");
            DropColumn("public.VehicleAvailabilities", "VehicleAvailabilityId");
            DropColumn("public.Vehicles", "LicensePlate");
            DropColumn("public.DriverAvailabilities", "DriverAvailabilityId");
            AddPrimaryKey("public.Departures", "Id");
            AddPrimaryKey("public.VehicleAvailabilities", "Id");
            AddPrimaryKey("public.DriverAvailabilities", "Id");
        }
    }
}
