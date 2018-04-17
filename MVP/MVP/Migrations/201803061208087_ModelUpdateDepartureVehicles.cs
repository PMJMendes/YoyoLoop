namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ModelUpdateDepartureVehicles : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.Vehicles", "Departure_DepartureId", c => c.Guid());
            CreateIndex("public.Vehicles", "Departure_DepartureId");
            AddForeignKey("public.Vehicles", "Departure_DepartureId", "public.Departures", "DepartureId");
        }
        
        public override void Down()
        {
            DropForeignKey("public.Vehicles", "Departure_DepartureId", "public.Departures");
            DropIndex("public.Vehicles", new[] { "Departure_DepartureId" });
            DropColumn("public.Vehicles", "Departure_DepartureId");
        }
    }
}
