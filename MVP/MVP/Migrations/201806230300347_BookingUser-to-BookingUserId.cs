namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class BookingUsertoBookingUserId : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("public.Bookings", "User_Id", "public.AspNetUsers");
            DropIndex("public.Bookings", new[] { "User_Id" });
            AddColumn("public.Bookings", "UserId", c => c.String());
            DropColumn("public.Bookings", "User_Id");
        }
        
        public override void Down()
        {
            AddColumn("public.Bookings", "User_Id", c => c.String(maxLength: 128));
            DropColumn("public.Bookings", "UserId");
            CreateIndex("public.Bookings", "User_Id");
            AddForeignKey("public.Bookings", "User_Id", "public.AspNetUsers", "Id");
        }
    }
}
