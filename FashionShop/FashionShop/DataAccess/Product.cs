namespace DataAccess
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Product
    {
        public int ProductId { get; set; }

        public int ProductTypeId { get; set; }

        [Required]
        [StringLength(50)]
        public string Code { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        [StringLength(50)]
        public string Image { get; set; }

        [StringLength(1000)]
        public string Description { get; set; }

        public decimal Price { get; set; }

        public int Quantity { get; set; }

        public bool? Status { get; set; }

        public string Content { get; set; }

        public virtual ProductType ProductType { get; set; }
    }
}
