using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWeb.DataAccess;

namespace MyWeb.Controllers
{
    public class ReviewController : Controller
    {

        private readonly RestaurantContext _dbContext = new RestaurantContext();

        // GET: Review
        public ActionResult Index()
        {
            var reviews = _dbContext.Reviews.ToList();

            return View(reviews);
        }

        [ChildActionOnly]
        public ActionResult BestReview()
        {
            
            var bestReview = _dbContext.Reviews.OrderByDescending(x => x.Rating).FirstOrDefault();

            return PartialView( "_ReviewItem", bestReview);
        }



        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Review review)
        {
            if (ModelState.IsValid)
            {
                _dbContext.Reviews.Add(review);
                _dbContext.SaveChanges();

                return RedirectToAction("Index", new { id = review.ID });
            }
            return View(review);
        }

        public ActionResult Edit(int id)
        {
            var model = _dbContext.Reviews.Find(id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(Review review)
        {
            if (ModelState.IsValid)
            {
                _dbContext.Entry(review).State = EntityState.Modified;
                _dbContext.SaveChanges();
                return RedirectToAction("Index", new { id = review.ID });
            }
            return View(review);
        }
    }
}