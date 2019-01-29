namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ApplicationUserType : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.AspNetUsers", "Type", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("public.AspNetUsers", "Type");
        }
    }
}
