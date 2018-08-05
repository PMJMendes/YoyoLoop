namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ApplicationUserBillingDetails : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.AspNetUsers", "BillingName", c => c.String());
            AddColumn("public.AspNetUsers", "BillingCompany", c => c.String());
            AddColumn("public.AspNetUsers", "BillingNIF", c => c.String());
            AddColumn("public.AspNetUsers", "BillingAdress", c => c.String());
            AddColumn("public.AspNetUsers", "BillingZIP", c => c.String());
            AddColumn("public.AspNetUsers", "BillingCity", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("public.AspNetUsers", "BillingCity");
            DropColumn("public.AspNetUsers", "BillingZIP");
            DropColumn("public.AspNetUsers", "BillingAdress");
            DropColumn("public.AspNetUsers", "BillingNIF");
            DropColumn("public.AspNetUsers", "BillingCompany");
            DropColumn("public.AspNetUsers", "BillingName");
        }
    }
}
