using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OdeToFood.Models;

namespace OdeToFood.Controllers
{
    public class RestaurantController : Controller
    {
        private readonly OdeToFoodDb _dbContext;

        public RestaurantController()
        {
            _dbContext = new OdeToFoodDb();
        }

        public RestaurantController(OdeToFoodDb dbContext)
        {
            _dbContext = dbContext;
        }

        //
        // GET: /Restaurant/

        public ActionResult Index()
        {
            return View(_dbContext.Restaurants.ToList());
        }

          //
        // GET: /Restaurant/Create
        //[Authorize(Roles = "admin")]
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Restaurant/Create

        [HttpPost]
        //[Authorize(Roles="admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Restaurant restaurant)
        {
            if (ModelState.IsValid)
            {
                _dbContext.Restaurants.Add(restaurant);
                _dbContext.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(restaurant);
        }

        //
        // GET: /Restaurant/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Restaurant restaurant = _dbContext.Restaurants.Single(r => r.Id == id);
            if (restaurant == null)
            {
                return HttpNotFound();
            }
            return View(restaurant);
        }

        //
        // POST: /Restaurant/Edit/5

        [HttpPost]
        public ActionResult Edit(Restaurant restaurant)
        {
            if (ModelState.IsValid)
            {
                var existingRestaurant = _dbContext.Restaurants.SingleOrDefault(x => x.Id == restaurant.Id);
                if (existingRestaurant != null)
                {
                    existingRestaurant.Name = restaurant.Name;
                    existingRestaurant.City = restaurant.City;
                    existingRestaurant.Country = restaurant.Country;

                    _dbContext.SaveChanges();
                }

                return RedirectToAction("Index");
            }

            return View(restaurant);
        }

        //
        // GET: /Restaurant/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Restaurant restaurant = _dbContext.Restaurants.Single(r => r.Id == id);
            if (restaurant == null)
            {
                return HttpNotFound();
            }
            return View(restaurant);
        }

        //
        // POST: /Restaurant/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            var restaurant = _dbContext.Restaurants.Single(r => r.Id == id);
            _dbContext.Restaurants.Remove(restaurant);
            _dbContext.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            _dbContext?.Dispose();
            base.Dispose(disposing);
        }
    }
}