namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ApplicationUserMemberGetMember : DbMigration
    {
        public override void Up()
        {
            AddColumn("public.AspNetUsers", "MGMCode", c => c.String());
            AddColumn("public.AspNetUsers", "ReferredBy_Id", c => c.String(maxLength: 128));
            CreateIndex("public.AspNetUsers", "ReferredBy_Id");
            AddForeignKey("public.AspNetUsers", "ReferredBy_Id", "public.AspNetUsers", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("public.AspNetUsers", "ReferredBy_Id", "public.AspNetUsers");
            DropIndex("public.AspNetUsers", new[] { "ReferredBy_Id" });
            DropColumn("public.AspNetUsers", "ReferredBy_Id");
            DropColumn("public.AspNetUsers", "MGMCode");
        }
    }
}
