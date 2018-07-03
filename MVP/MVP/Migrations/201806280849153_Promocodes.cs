namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Promocodes : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "public.Promocodes",
                c => new
                    {
                        PromocodeId = c.Guid(nullable: false),
                        Active = c.Boolean(nullable: false),
                        Code = c.String(),
                        StartDate = c.DateTime(nullable: false),
                        EndDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.PromocodeId);
            
        }
        
        public override void Down()
        {
            DropTable("public.Promocodes");
        }
    }
}
