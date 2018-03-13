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
        public ActionResult Index(string productType, string keyword)
        {
            var model = new ProductListViewModel
            {
                ProductType = productType,
                Keyword = keyword,
                ProductItems = GetProducts(productType,keyword)
            };
            ViewBag.Keyword = keyword;
            ViewBag.ProductType = productType;
            return View(model);
        }
        
      

        private List<ProductItem> GetProducts(string productType, string keyword)
        {
            using (var dbContext = new FashionShopEntities())
            {
                var query = dbContext.Products.AsQueryable();
                if(!string.IsNullOrEmpty(productType))
                {
                    query = query.Where(x => x.ProductType.Name.Equals(productType));
                }

                if (!string.IsNullOrEmpty(keyword))
                {
                    query = query.Where(x => x.Name.Contains(keyword));
                }

                var productItems = query.Select(x => new ProductItem()
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

        private List<ProductItem> SearchProducts(string keyword)
        {
            using (var dbContext = new FashionShopEntities())
            {
                var productItems = dbContext.Products.Where(x => x.Name.Contains(keyword)).Select(x => new ProductItem()
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