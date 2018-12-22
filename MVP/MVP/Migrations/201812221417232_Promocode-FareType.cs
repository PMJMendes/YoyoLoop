namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class PromocodeFareType : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.Promocodes", "FareType", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("public.Promocodes", "FareType");
        }
    }
}
