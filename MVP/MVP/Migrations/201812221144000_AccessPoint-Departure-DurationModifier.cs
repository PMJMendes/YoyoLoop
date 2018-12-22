namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AccessPointDepartureDurationModifier : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.AccessPoints", "DurationModifier", c => c.Time(nullable: false, precision: 6));
            AddColumn("public.Departures", "DurationModifier", c => c.Time(nullable: false, precision: 6));
        }
        
        public override void Down()
        {
            DropColumn("public.Departures", "DurationModifier");
            DropColumn("public.AccessPoints", "DurationModifier");
        }
    }
}
