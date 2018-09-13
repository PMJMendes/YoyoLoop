namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class BookingMGM : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.Bookings", "MGM", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("public.Bookings", "MGM");
        }
    }
}
