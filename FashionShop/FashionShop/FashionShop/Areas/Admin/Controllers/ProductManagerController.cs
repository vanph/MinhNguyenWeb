using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataAccess;

namespace FashionShop.Areas.Admin.Controllers
{
    public class ProductManagerController : Controller
    {
        // GET: Admin/ProductManager
        public ActionResult Index()
        {
            var dbContext = new FashionShopEntities();

            var model = dbContext.Products.ToList();

            return View(model);
          
        }

        public ActionResult Sizes()
        {
            var dbContext = new FashionShopEntities();

            var model = dbContext.Sizes.ToList();

            return View(model);

        }
        public ActionResult ProductTypes()
        {
            var dbContext = new FashionShopEntities();

            var model = dbContext.ProductTypes.ToList();

            return View(model);

        }
    }
}