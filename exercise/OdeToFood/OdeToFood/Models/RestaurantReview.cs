namespace OdeToFood.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("RestaurantReview")]
    public partial class RestaurantReview
    {
        public int Id { get; set; }

        public int Rating { get; set; }

        [Required]
        [StringLength(1024)]
        public string Body { get; set; }

        [Required]
        [StringLength(100)]
        public string ReviewerName { get; set; }

        public int RestaurantId { get; set; }

        public virtual Restaurant Restaurant { get; set; }
    }
}
