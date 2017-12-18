using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FashionShop.ViewModels
{
    public class ProductListViewModel
    {
        public  string ProductType { get; set; }

        public  List<ProductItem> ProductItems { get; set; }

        public ProductListViewModel()
        {
            ProductItems = new List<ProductItem>();
        }
    }
}