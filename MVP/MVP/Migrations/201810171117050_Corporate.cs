namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Corporate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "public.Corporates",
                c => new
                    {
                        CorporateId = c.Guid(nullable: false),
                        Active = c.Boolean(nullable: false),
                        CompanyName = c.String(),
                    })
                .PrimaryKey(t => t.CorporateId);
            
            AddColumn("public.AspNetUsers", "BillingCostCenter", c => c.String());
            AddColumn("public.AspNetUsers", "Company_CorporateId", c => c.Guid());
            CreateIndex("public.AspNetUsers", "Company_CorporateId");
            AddForeignKey("public.AspNetUsers", "Company_CorporateId", "public.Corporates", "CorporateId");
        }
        
        public override void Down()
        {
            DropForeignKey("public.AspNetUsers", "Company_CorporateId", "public.Corporates");
            DropIndex("public.AspNetUsers", new[] { "Company_CorporateId" });
            DropColumn("public.AspNetUsers", "Company_CorporateId");
            DropColumn("public.AspNetUsers", "BillingCostCenter");
            DropTable("public.Corporates");
        }
    }
}
