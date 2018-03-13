namespace DataAccess
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public Guid OrderId { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SeqId { get; set; }

        public Guid? CustomerId { get; set; }

        public int PaymentMethodId { get; set; }


        [Required]
        [StringLength(250)]
        public string FullName { get; set; }

        [Required]
        [EmailAddress]
        [StringLength(50)]
        public string EmailAdress { get; set; }
        [Required]
        [StringLength(20)]
        public string Phone { get; set; }

        [Required]
        [StringLength(250)]
        public string LineAddress { get; set; }

        [Required]
        [StringLength(50)]
        public string District { get; set; }

        [Required]
        [StringLength(50)]
        public string City { get; set; }

        [StringLength(250)]
        public string Note { get; set; }

        public int OrderStatusId { get; set; }

        public decimal Amount { get; set; }

        public decimal AmountPaint { get; set; }

        public DateTime CreatedDate { get; set; }

        [Required]
        [StringLength(50)]
        public string CreateBy { get; set; }

        public DateTime ModifiedDate { get; set; }

        [Required]
        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public virtual Customer Customer { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

        public virtual OrderStatus OrderStatus { get; set; }

        public virtual PaymentMethod PaymentMethod { get; set; }
    }
}
