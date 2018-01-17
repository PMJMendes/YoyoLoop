namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialDataModel : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "public.AccessPoints",
                c => new
                    {
                        AccessPointId = c.Guid(nullable: false),
                        Name = c.String(),
                        Region_LoopedRegionId = c.Guid(),
                    })
                .PrimaryKey(t => t.AccessPointId)
                .ForeignKey("public.LoopedRegions", t => t.Region_LoopedRegionId)
                .Index(t => t.Region_LoopedRegionId);
            
            CreateTable(
                "public.LoopedRegions",
                c => new
                    {
                        LoopedRegionId = c.Guid(nullable: false),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.LoopedRegionId);
            
            CreateTable(
                "public.AccessPointHosts",
                c => new
                    {
                        AccessPointHostId = c.Guid(nullable: false),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.AccessPointHostId);
            
            CreateTable(
                "public.Drivers",
                c => new
                    {
                        DriverId = c.Guid(nullable: false),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.DriverId);
            
            CreateTable(
                "public.Routes",
                c => new
                    {
                        RouteId = c.Guid(nullable: false),
                        Name = c.String(),
                        MinStartTime = c.Time(nullable: false, precision: 6),
                        MaxEndTime = c.Time(nullable: false, precision: 6),
                        Duration = c.Time(nullable: false, precision: 6),
                        EndRegion_LoopedRegionId = c.Guid(),
                        StartRegion_LoopedRegionId = c.Guid(),
                    })
                .PrimaryKey(t => t.RouteId)
                .ForeignKey("public.LoopedRegions", t => t.EndRegion_LoopedRegionId)
                .ForeignKey("public.LoopedRegions", t => t.StartRegion_LoopedRegionId)
                .Index(t => t.EndRegion_LoopedRegionId)
                .Index(t => t.StartRegion_LoopedRegionId);
            
            CreateTable(
                "public.Trips",
                c => new
                    {
                        TripId = c.Guid(nullable: false),
                        StartTime = c.DateTime(nullable: false),
                        EndTime = c.DateTime(nullable: false),
                        EndAccessPoint_AccessPointId = c.Guid(),
                        StartAccessPoint_AccessPointId = c.Guid(),
                    })
                .PrimaryKey(t => t.TripId)
                .ForeignKey("public.AccessPoints", t => t.EndAccessPoint_AccessPointId)
                .ForeignKey("public.AccessPoints", t => t.StartAccessPoint_AccessPointId)
                .Index(t => t.EndAccessPoint_AccessPointId)
                .Index(t => t.StartAccessPoint_AccessPointId);
            
            CreateTable(
                "public.Vehicles",
                c => new
                    {
                        VehicleId = c.Guid(nullable: false),
                    })
                .PrimaryKey(t => t.VehicleId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("public.Trips", "StartAccessPoint_AccessPointId", "public.AccessPoints");
            DropForeignKey("public.Trips", "EndAccessPoint_AccessPointId", "public.AccessPoints");
            DropForeignKey("public.Routes", "StartRegion_LoopedRegionId", "public.LoopedRegions");
            DropForeignKey("public.Routes", "EndRegion_LoopedRegionId", "public.LoopedRegions");
            DropForeignKey("public.AccessPoints", "Region_LoopedRegionId", "public.LoopedRegions");
            DropIndex("public.Trips", new[] { "StartAccessPoint_AccessPointId" });
            DropIndex("public.Trips", new[] { "EndAccessPoint_AccessPointId" });
            DropIndex("public.Routes", new[] { "StartRegion_LoopedRegionId" });
            DropIndex("public.Routes", new[] { "EndRegion_LoopedRegionId" });
            DropIndex("public.AccessPoints", new[] { "Region_LoopedRegionId" });
            DropTable("public.Vehicles");
            DropTable("public.Trips");
            DropTable("public.Routes");
            DropTable("public.Drivers");
            DropTable("public.AccessPointHosts");
            DropTable("public.LoopedRegions");
            DropTable("public.AccessPoints");
        }
    }
}
