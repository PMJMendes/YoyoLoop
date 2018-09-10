namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class BookingPromocodeToString : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("public.Bookings", "Promocode_PromocodeId", "public.Promocodes");
            DropIndex("public.Bookings", new[] { "Promocode_PromocodeId" });
            AddColumn("public.Bookings", "Promocode", c => c.String());
            DropColumn("public.Bookings", "Promocode_PromocodeId");
        }
        
        public override void Down()
        {
            AddColumn("public.Bookings", "Promocode_PromocodeId", c => c.Guid());
            DropColumn("public.Bookings", "Promocode");
            CreateIndex("public.Bookings", "Promocode_PromocodeId");
            AddForeignKey("public.Bookings", "Promocode_PromocodeId", "public.Promocodes", "PromocodeId");
        }
    }
}
