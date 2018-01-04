using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataAccess;
using FashionShop.ViewModels;

namespace FashionShop.Controllers
{
    public class ProductDetailController : Controller
    {
        // GET: ProductDetail
        public ActionResult Index(string productCode)
        {
            ProductDetailViewModel model = null;

            var dbContext = new FashionShopEntities();
            
            var product = dbContext.Products.FirstOrDefault(x=> x.Code.Equals(productCode));

            if (product != null && product.ProductVariants.Count> 0)
            {
                var productVariantViewModels = product.ProductVariants.Select(x => new ProductVariantViewModel
                {
                    ProductVariantId = x.ProductVariantId,
                    ProductId = x.ProductId,
                    VariantCode = x.Code,
                    SizeId = x.SizeId,
                    Size = x.Size.SizeName,
                    ColorId = x.ColorId,
                    Color = x.Color != null ? x.Color.ColorName : string.Empty,
                    QuantityInStock = x.Quantity
                }).ToList();

                model = new ProductDetailViewModel
                {
                    Name = product.Name,
                    Price = product.Price,
                    ImageSrc = product.Image,
                    Content = product.Content,
                    Code = product.Code,
                    Variants = productVariantViewModels
                };
                
            }

            return View(model);
        }
    }
}