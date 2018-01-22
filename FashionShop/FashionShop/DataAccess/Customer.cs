namespace DataAccess
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Customer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer()
        {
            Orders = new HashSet<Order>();
        }

        public Guid CustomerId { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Seqid { get; set; }

        [StringLength(50)]
        public string CustomerName { get; set; }

        public int? Phone { get; set; }

        [StringLength(250)]
        public string LineAddress { get; set; }

        [StringLength(50)]
        public string District { get; set; }

        [StringLength(50)]
        public string City { get; set; }

        public DateTime CreatedDate { get; set; }

        [Required]
        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime ModifiedDate { get; set; }

        [Required]
        [StringLength(50)]
        public string ModifiedBy { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }

        public virtual User User { get; set; }
    }
}
