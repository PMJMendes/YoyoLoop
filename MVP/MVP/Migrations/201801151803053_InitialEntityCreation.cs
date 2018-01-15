namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialEntityCreation : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "public.AccessPoints",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "public.AccessPointHosts",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "public.Drivers",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "public.Routes",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "public.Trips",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "public.Vehicles",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropTable("public.Vehicles");
            DropTable("public.Trips");
            DropTable("public.Routes");
            DropTable("public.Drivers");
            DropTable("public.AccessPointHosts");
            DropTable("public.AccessPoints");
        }
    }
}
