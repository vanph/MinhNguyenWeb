using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FashionShop.Controllers
{
    public class HomeMenuController : Controller
    {
        // GET: HomeMenu
        public ActionResult Index()
        {
            return View();
        }
    }
}