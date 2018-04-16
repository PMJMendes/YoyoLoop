namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ModelUpdateFares : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "public.Fares",
                c => new
                    {
                        FareId = c.Guid(nullable: false),
                        FareType = c.Int(nullable: false),
                        Price = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Route_RouteId = c.Guid(),
                    })
                .PrimaryKey(t => t.FareId)
                .ForeignKey("public.Routes", t => t.Route_RouteId)
                .Index(t => t.Route_RouteId);
            
            DropColumn("public.Routes", "StandardFare");
            DropColumn("public.Routes", "LastMinuteFare");
        }
        
        public override void Down()
        {
            AddColumn("public.Routes", "LastMinuteFare", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AddColumn("public.Routes", "StandardFare", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            DropForeignKey("public.Fares", "Route_RouteId", "public.Routes");
            DropIndex("public.Fares", new[] { "Route_RouteId" });
            DropTable("public.Fares");
        }
    }
}
