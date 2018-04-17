namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ModelReworkMinorClassFiles : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.Fares", "Type", c => c.Int(nullable: false));
            DropColumn("public.Fares", "FareType");
        }
        
        public override void Down()
        {
            AddColumn("public.Fares", "FareType", c => c.Int(nullable: false));
            DropColumn("public.Fares", "Type");
        }
    }
}
