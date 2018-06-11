namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class BookingTicketCode : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.Bookings", "TicketCode", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("public.Bookings", "TicketCode");
        }
    }
}
