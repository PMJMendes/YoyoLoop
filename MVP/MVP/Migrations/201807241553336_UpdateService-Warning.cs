namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdateServiceWarning : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.UpdateServices", "Warning", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("public.UpdateServices", "Warning");
        }
    }
}
