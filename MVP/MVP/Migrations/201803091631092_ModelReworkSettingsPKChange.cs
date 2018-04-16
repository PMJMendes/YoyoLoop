namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ModelReworkSettingsPKChange : DbMigration
    {
        public override void Up()
        {
            DropPrimaryKey("public.Settings");
            AddColumn("public.Settings", "SettingsId", c => c.Guid(nullable: false));
            AddPrimaryKey("public.Settings", "SettingsId");
            DropColumn("public.Settings", "Id");
        }
        
        public override void Down()
        {
            AddColumn("public.Settings", "Id", c => c.Int(nullable: false, identity: true));
            DropPrimaryKey("public.Settings");
            DropColumn("public.Settings", "SettingsId");
            AddPrimaryKey("public.Settings", "Id");
        }
    }
}
