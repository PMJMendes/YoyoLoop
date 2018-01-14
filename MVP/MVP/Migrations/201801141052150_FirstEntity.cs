namespace MVP.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class FirstEntity : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "public.LoopedRegions",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropTable("public.LoopedRegions");
        }
    }
}
