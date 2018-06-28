namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class BookingFareType : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.Bookings", "Fare", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("public.Bookings", "Fare");
        }
    }
}
