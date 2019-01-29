namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DriverDetails : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.Drivers", "Email", c => c.String());
            AddColumn("public.Drivers", "Phone", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("public.Drivers", "Phone");
            DropColumn("public.Drivers", "Email");
        }
    }
}
