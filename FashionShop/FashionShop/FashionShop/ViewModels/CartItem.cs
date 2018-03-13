using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccess;

namespace FashionShop.ViewModels
{
    [Serializable]
    public class CartItem
    {
        public int ProductVariantId { get; set; }
        public string VariantCode { get; set; }
        public string ImageSrc { get; set; }
        public int Quantity { get; set; }

        public string ProductName { get; set; }
        public string ProductLink { get; set; }
        public string Size { get; set; }
        public string Color { get; set; }
        public decimal Price { get; set; }

        public decimal Money => Quantity * Price;
    }
}