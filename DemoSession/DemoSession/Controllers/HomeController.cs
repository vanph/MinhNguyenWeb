using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoSession.Controllers
{
    public class HomeController : Controller
    {
        private const string SpCart = "SPCart";

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            //var cart = Session[SpCart] as CartItem ?? new CartItem();
            //cart.Quantity = cart.Quantity + 1;
            //Session[SpCart] = cart;

            var cart = SessionHelper.Get<CartItem>(SpCart) ?? new CartItem();

            cart.Quantity = cart.Quantity + 1;

            SessionHelper.Set(SpCart, cart);

            ViewBag.Message = $"Count: {cart.Quantity}";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }

    public class CartItem
    {
        public int Quantity { get; set; }
    }
}