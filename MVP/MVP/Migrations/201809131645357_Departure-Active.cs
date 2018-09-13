namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DepartureActive : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.Departures", "Active", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("public.Departures", "Active");
        }
    }
}
