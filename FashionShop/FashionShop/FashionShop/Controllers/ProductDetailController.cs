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

            if (product != null)
            {
                model = new ProductDetailViewModel
                {
                    Name = product.Name,
                    Price = product.Price,
                    ImageSrc = product.Image
                };
                
            }

            return View(model);
        }
    }
}