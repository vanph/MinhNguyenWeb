using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FashionShop.Controllers
{
    public class OrderConfirmationController : Controller
    {
        // GET: OrderConfirmation
        public ActionResult Index(Guid? orderId)
        {
            return View();
        }
    }
}