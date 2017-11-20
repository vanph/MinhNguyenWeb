namespace OdeToFood.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class OdeToFoodDb : DbContext
    {
        public OdeToFoodDb()
            : base("name=OdeToFoodDb")
        {
        }

        public virtual DbSet<Restaurant> Restaurants { get; set; }
        public virtual DbSet<RestaurantReview> RestaurantReviews { get; set; }
        public virtual DbSet<UserProfile> UserProfiles { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Restaurant>()
                .HasMany(e => e.RestaurantReviews)
                .WithRequired(e => e.Restaurant)
                .WillCascadeOnDelete(false);
        }
    }
}
