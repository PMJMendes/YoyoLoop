namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ApplicationUserCreationDate : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.AspNetUsers", "CreationDate", c => c.DateTime(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("public.AspNetUsers", "CreationDate");
        }
    }
}
