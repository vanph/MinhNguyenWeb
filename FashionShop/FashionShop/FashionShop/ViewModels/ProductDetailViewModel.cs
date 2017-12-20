using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FashionShop.ViewModels
{
    public class ProductDetailViewModel
    {
        public string ImageSrc { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Size { get; set; }
    }
}