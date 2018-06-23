namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class BookingUser : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.Bookings", "User_Id", c => c.String(maxLength: 128));
            CreateIndex("public.Bookings", "User_Id");
            AddForeignKey("public.Bookings", "User_Id", "public.AspNetUsers", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("public.Bookings", "User_Id", "public.AspNetUsers");
            DropIndex("public.Bookings", new[] { "User_Id" });
            DropColumn("public.Bookings", "User_Id");
        }
    }
}
