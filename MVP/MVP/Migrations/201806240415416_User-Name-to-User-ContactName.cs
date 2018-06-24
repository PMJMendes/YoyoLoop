namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UserNametoUserContactName : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.AspNetUsers", "ContactName", c => c.String());
            DropColumn("public.AspNetUsers", "Name");
        }
        
        public override void Down()
        {
            AddColumn("public.AspNetUsers", "Name", c => c.String());
            DropColumn("public.AspNetUsers", "ContactName");
        }
    }
}
