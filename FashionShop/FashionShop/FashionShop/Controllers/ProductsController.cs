using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FashionShop.ViewModels;

namespace FashionShop.Controllers
{
    public class ProductsController : Controller
    {
        // GET: Products
        public ActionResult Index()
        {
            var model = new ProductListViewModel();

            model.ProductType = "Women";
            model.ProductItems = GetProducts();

            return View(model);
        }

        private List<ProductItem> GetProducts()
        {
            var products = new List<ProductItem>()
            {
                new ProductItem()
                {
                    Title ="Black Shoulder Bag 1xxx123",
                    ImageSrc = @"/Content/img/anh1.jpg",
                    Price = 10.0m,
                    DetailLink = ""
                },
                new ProductItem()
                {
                    Title ="Black ",
                    ImageSrc = @"/Content/img/anh1.jpg",
                    Price = 20.0m,
                    DetailLink = ""
                },
                new ProductItem()
                {
                    Title ="Bag ",
                    ImageSrc = @"/Content/img/anh1.jpg",
                    Price = 134.0m,
                    DetailLink = ""
                },
                new ProductItem()
                {
                    Title ="Copytox",
                    ImageSrc = @"/Content/img/anh1.jpg",
                    Price =50.0m,
                    DetailLink = ""
                },
                new ProductItem()
                {
                    Title ="Fashion",
                    ImageSrc = @"/Content/img/anh1.jpg",
                    Price = 54.0m,
                    DetailLink = ""
                }
                ,new ProductItem()
                {
                    Title ="KEnzo",
                    ImageSrc = @"/Content/img/anh1.jpg",
                    Price = 20.0m,
                    DetailLink = ""
                },
                new ProductItem()
                {
                    Title ="Crown",
                    ImageSrc = @"/Content/img/anh1.jpg",
                    Price = 30m,
                    DetailLink = ""
                }

            };

            return products;
        }
    }
}