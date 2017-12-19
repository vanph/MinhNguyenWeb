using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataAccess;
using FashionShop.ViewModels;

namespace FashionShop.Controllers
{
    public class ProductsController : Controller
    {
        // GET: Products
        public ActionResult Index(string productType)
        {
            var model = new ProductListViewModel
            {
                ProductType = productType,
                ProductItems = GetProducts(productType)
            };

            return View(model);
        }

        private List<ProductItem> GetProducts(string productType)
        {
            using (var dbContext = new FashionShopEntities())
            {
                var productItems = dbContext.Products.Where(x => x.ProductType.Name.Equals(productType)).Select(x => new ProductItem()
                {
                    Name = x.Name,
                    Price = x.Price,
                    ImageSrc = x.Image,
                    Code = x.Code
                }).ToList();

                foreach (var item in productItems)
                {
                    item.DetailLink = BuildDetailLink(item.Code);
                }

                return productItems;
            }

        }

        private string BuildDetailLink(string code)
        {
            return $"/ProductDetail?productCode={code}";
        }

    }
}