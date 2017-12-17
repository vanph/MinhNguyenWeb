using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AjaxEx.Models;


namespace AjaxEx.Controllers
{
    public class RestaurantController : Controller
    {
        private readonly RestaurantEntities _dbContext = new RestaurantEntities();
        // GET: Restaurant

        public ActionResult Index(string searchTerm)
        {
            var model = _dbContext.Restaurants
                .OrderByDescending(r => r.RestaurantReviews.Average(review => review.Rating))
                .Where(r => searchTerm == null || r.Name.Contains(searchTerm))
                .Select(r => new RestaurantListViewModel
                {
                    Id = r.Id,
                    Name = r.Name,
                    City = r.City,
                    Country = r.Country,
                    CountOfReviews = r.RestaurantReviews.Count(),
                }).ToList();

               
        //ViewBag.term = searchTerm;
                return View(model);
        }
       
    }
}