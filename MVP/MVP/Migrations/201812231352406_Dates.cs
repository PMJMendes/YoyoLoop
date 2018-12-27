namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Dates : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "public.Dates",
                c => new
                    {
                        Date = c.DateTime(nullable: false),
                        DayType = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Date);
            
        }
        
        public override void Down()
        {
            DropTable("public.Dates");
        }
    }
}
