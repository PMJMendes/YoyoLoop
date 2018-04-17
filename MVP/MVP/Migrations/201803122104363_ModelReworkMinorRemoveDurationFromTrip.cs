namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ModelReworkMinorRemoveDurationFromTrip : DbMigration
    {
        public override void Up()
        {
            DropColumn("public.Trips", "Duration");
        }
        
        public override void Down()
        {
            AddColumn("public.Trips", "Duration", c => c.Time(nullable: false, precision: 6));
        }
    }
}
