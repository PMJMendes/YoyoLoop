namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class TripExplorer : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.Routes", "DepartureInterval", c => c.Time(nullable: false, precision: 6));
            DropColumn("public.Routes", "Name");
        }
        
        public override void Down()
        {
            AddColumn("public.Routes", "Name", c => c.String());
            DropColumn("public.Routes", "DepartureInterval");
        }
    }
}
