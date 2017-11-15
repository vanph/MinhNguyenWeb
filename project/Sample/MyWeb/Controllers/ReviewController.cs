using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyWeb.Models;
using MyWeb.Repositories;

namespace MyWeb.Controllers
{
    public class ReviewController : Controller
    {
        private ReviewRepository _reviewRepository;

        public ReviewController()
        {
            _reviewRepository = new ReviewRepository();
        }
        // GET: Review
        public ActionResult Index()
        {
            var reviews = _reviewRepository.GetReviews();

            return View(reviews);
        }

        [ChildActionOnly]
        public ActionResult BestReview()
        {
            var reviews = _reviewRepository.GetReviews();

            var bestReview = reviews.OrderByDescending(x => x.Rating).FirstOrDefault();

            return PartialView( "_ReviewItem", bestReview);
        }



        public ActionResult Create()
        {
            return View();
        }
    }
}