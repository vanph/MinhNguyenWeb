﻿using OdeToFood.Models;
using System.Linq;
using System.Web.Mvc;
using PagedList;
using System.Web.UI;

namespace OdeToFood.Controllers
{
    
    public class HomeController : Controller
    {
        readonly OdeToFoodDb _db;

        public HomeController()
        {
            _db = new OdeToFoodDb();
        }

        public HomeController(OdeToFoodDb db)
        {
            _db = db;
        }

        public ActionResult Autocomplete(string term)
        {
            var model = _db.Restaurants
                   .Where(r => r.Name.StartsWith(term))
                   .Take(10)
                   .Select(r => new
                   {
                       label = r.Name
                   });

            return Json(model, JsonRequestBehavior.AllowGet);
        }
        [OutputCache(CacheProfile = "Long", VaryByHeader = "X-Requested-With;Accept-Language", Location = OutputCacheLocation.Server)]
        public ActionResult Index(string searchTerm = null, int page = 1)
        {
            var greeting = OdeToFood.Views.Home.Resources.Greeting;

            var model =
                _db.Restaurants
                   .OrderByDescending(r => r.RestaurantReviews.Average(review => review.Rating))
                   .Where(r => searchTerm == null || r.Name.StartsWith(searchTerm))
                   .Select(r => new RestaurantListViewModel
                            {
                                Id = r.Id,
                                Name = r.Name,
                                City = r.City,
                                Country = r.Country,
                                CountOfReviews = r.RestaurantReviews.Count()
                            }).ToPagedList(page, 10);

            if (Request.IsAjaxRequest())
            {
                return PartialView("_Restaurants", model);
            }

            return View(model);
        }


        public ActionResult About()
        {
            var model = new AboutModel
            {
                Name = ".Net Programming - xTer",
                Location = "HN, Viet Nam"
            };

            return View(model);
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        protected override void Dispose(bool disposing)
        {
            _db?.Dispose();

            base.Dispose(disposing);
        }
    }
}
