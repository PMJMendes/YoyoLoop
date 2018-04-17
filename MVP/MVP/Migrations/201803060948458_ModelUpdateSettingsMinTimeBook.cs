namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ModelUpdateSettingsMinTimeBook : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.Settings", "MinTimeBookLastMinute", c => c.Time(nullable: false, precision: 6));
            DropColumn("public.Settings", "MemberGetMemberPrice");
        }
        
        public override void Down()
        {
            AddColumn("public.Settings", "MemberGetMemberPrice", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            DropColumn("public.Settings", "MinTimeBookLastMinute");
        }
    }
}
