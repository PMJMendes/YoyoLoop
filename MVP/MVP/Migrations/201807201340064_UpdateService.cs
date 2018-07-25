namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdateService : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "public.UpdateServices",
                c => new
                    {
                        UpdateServiceId = c.Guid(nullable: false),
                        LastRun = c.DateTime(nullable: false),
                        LastDaily = c.DateTime(nullable: false),
                        WarningThreshold = c.Time(nullable: false, precision: 6),
                    })
                .PrimaryKey(t => t.UpdateServiceId);
            
        }
        
        public override void Down()
        {
            DropTable("public.UpdateServices");
        }
    }
}
