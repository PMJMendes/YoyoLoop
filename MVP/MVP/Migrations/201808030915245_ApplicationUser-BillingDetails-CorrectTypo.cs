namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ApplicationUserBillingDetailsCorrectTypo : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.AspNetUsers", "BillingAddress", c => c.String());
            DropColumn("public.AspNetUsers", "BillingAdress");
        }
        
        public override void Down()
        {
            AddColumn("public.AspNetUsers", "BillingAdress", c => c.String());
            DropColumn("public.AspNetUsers", "BillingAddress");
        }
    }
}
