namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ModelUpdateDefaultAP : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.AccessPoints", "Default", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("public.AccessPoints", "Default");
        }
    }
}
