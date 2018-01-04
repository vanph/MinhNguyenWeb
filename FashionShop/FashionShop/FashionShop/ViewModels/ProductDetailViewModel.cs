using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FashionShop.ViewModels
{
    public class ProductDetailViewModel
    {   
        public int ProductId { get; set; }

        public string Code { get; set; }

        public string ImageSrc { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Content { get; set; }

        public List<ProductVariantViewModel> Variants { get; set; }

        public List<string> AvailableSizes
        {
            get { return Variants.OrderBy(x=> x.SizeId).Select(x => x.Size).Distinct().ToList(); }
        }


        public List<string> AvailableColors
        {
            get { return Variants.Where(x => x.ColorId.HasValue).Select(x => x.Color).Distinct().ToList(); }
        }

        public ProductVariantViewModel DefaultVariant => Variants.FirstOrDefault();

        public ProductDetailViewModel()
        {
            Variants = new List<ProductVariantViewModel>();
        }

    }


    public  class ProductVariantViewModel
    {
        public int ProductVariantId { get; set; }

        public int ProductId { get; set; }

        public string VariantCode { get; set; }

        public int SizeId { get; set; }

        public string Size { get; set; }

        public int? ColorId { get; set; }

        public  string Color { get; set; }

        public int QuantityInStock { get; set; }
    
    }
}