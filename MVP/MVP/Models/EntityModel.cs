using MVP.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MVP.Models
{
    public class EntityModel : ApplicationDbContext
    {
        public EntityModel()
        {

        }

        DbSet<LoopedRegion> LoopedRegion {get; set;}

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("public");
            base.OnModelCreating(modelBuilder);
        }
    }

}