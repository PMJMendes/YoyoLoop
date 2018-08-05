namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ApplicationUserBirthDate : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.AspNetUsers", "BirthDate", c => c.DateTime(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("public.AspNetUsers", "BirthDate");
        }
    }
}
