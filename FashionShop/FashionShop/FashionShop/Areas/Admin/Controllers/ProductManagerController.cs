using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataAccess;

namespace FashionShop.Areas.Admin.Controllers
{
    public class ProductManagerController : Controller
    {
        private readonly FashionShopEntities _dbContext;

        public ProductManagerController()
        {
            _dbContext= new FashionShopEntities();
        }
        public ProductManagerController(FashionShopEntities dbContext)
        {
            _dbContext = dbContext;
        }
        // GET: Admin/ProductManager
        public ActionResult Index()
        {
            return View(_dbContext.Products.ToList());
        }

   
        public ActionResult Sizes()
        {
            return View(_dbContext.Sizes.ToList());

        }
        public ActionResult Color()
        {
            return View(_dbContext.Colors.ToList());

        }
        public ActionResult ProductTypes()
        {
      
            return View(_dbContext.ProductTypes.ToList());

        }
        public ActionResult Create()
        {
            //SelectList
            ViewBag.ProductTypes = _dbContext.ProductTypes.ToList();

            return View();
        }


        [HttpPost]
        public ActionResult Create(Product product)
        {
            if (ModelState.IsValid)
            {
                    _dbContext.Products.Add(product);
                    _dbContext.SaveChanges();
                    return RedirectToAction("Index");
                
            }
            return View(product);
        }
        public ActionResult Edit(int id)
        {
            return View(_dbContext.Products.Find(id));
        }
        [HttpPost]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                _dbContext.Entry(product).State = EntityState.Modified;
                _dbContext.SaveChanges();
                return RedirectToAction("Index", new { id = product.ProductId });
            }
            return View(product);
        }
        public ActionResult Delete(int id = 0)
        {
            Product product = _dbContext.Products.Single(r => r.ProductId == id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            var product = _dbContext.Products.Single(r => r.ProductId == id);
            _dbContext.Products.Remove(product);
            _dbContext.SaveChanges();
            return RedirectToAction("Index");
        }



    }
}