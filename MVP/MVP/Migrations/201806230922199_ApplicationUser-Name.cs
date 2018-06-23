namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ApplicationUserName : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.AspNetUsers", "Name", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("public.AspNetUsers", "Name");
        }
    }
}
