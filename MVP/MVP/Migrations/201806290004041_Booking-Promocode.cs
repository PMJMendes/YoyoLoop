namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class BookingPromocode : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.Bookings", "FareType", c => c.Int(nullable: false));
            AddColumn("public.Bookings", "Promocode_PromocodeId", c => c.Guid());
            CreateIndex("public.Bookings", "Promocode_PromocodeId");
            AddForeignKey("public.Bookings", "Promocode_PromocodeId", "public.Promocodes", "PromocodeId");
            DropColumn("public.Bookings", "Fare");
        }
        
        public override void Down()
        {
            AddColumn("public.Bookings", "Fare", c => c.Int(nullable: false));
            DropForeignKey("public.Bookings", "Promocode_PromocodeId", "public.Promocodes");
            DropIndex("public.Bookings", new[] { "Promocode_PromocodeId" });
            DropColumn("public.Bookings", "Promocode_PromocodeId");
            DropColumn("public.Bookings", "FareType");
        }
    }
}
