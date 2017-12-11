namespace AjaxEx.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class RestaurantEntities : DbContext
    {
        public RestaurantEntities()
            : base("name=RestaurantEntities")
        {
        }

        public virtual DbSet<Restaurant> Restaurants { get; set; }
        public virtual DbSet<RestaurantReview> RestaurantReviews { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Restaurant>()
                .HasMany(e => e.RestaurantReviews)
                .WithRequired(e => e.Restaurant)
                .WillCascadeOnDelete(false);
        }
    }
}
