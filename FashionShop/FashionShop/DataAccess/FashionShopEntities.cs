namespace DataAccess
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class FashionShopEntities : DbContext
    {
        public FashionShopEntities()
            : base("name=FashionShopEntities")
        {
        }

        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductType> ProductTypes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Product>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<ProductType>()
                .HasMany(e => e.Products)
                .WithRequired(e => e.ProductType)
                .WillCascadeOnDelete(false);
        }
    }
}
