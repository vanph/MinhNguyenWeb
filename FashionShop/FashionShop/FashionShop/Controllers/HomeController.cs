using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FashionShop.Common;
using FashionShop.ViewModels;

namespace FashionShop.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [ChildActionOnly]
        public ActionResult Header()
        {
            var model = new HeaderViewModel();

            var cartItems = Session[Constants.ShoppingCart] as List<CartItem> ?? new List<CartItem>();

            model.CartTotal = new CartTotal
            {
                TotalMoney = cartItems.Select(x => x.Money).Sum(),
                TotalQuantity = cartItems.Select(x => x.Quantity).Sum()
            };

            return PartialView("_Header", model);
        }
    }
}