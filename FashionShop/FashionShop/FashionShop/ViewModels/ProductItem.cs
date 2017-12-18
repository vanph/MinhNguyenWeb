using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FashionShop.ViewModels
{
    public class ProductItem
    {
        public string ImageSrc { get; set; } 
        public  string DetailLink { get; set; }
        public string Title { get; set; }

        public decimal Price { get; set; }

    }
}