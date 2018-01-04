namespace DataAccess
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Order")]
    public partial class Order
    {
        public int OrderID { get; set; }

        public int? UserID { get; set; }

        [StringLength(50)]
        public string ShipName { get; set; }

        public int? ShipMobile { get; set; }

        [StringLength(250)]
        public string ShipAddress { get; set; }
    }
}
