using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using DataAccess;
using FashionShop.Common;
using FashionShop.ViewModels;

namespace FashionShop.Controllers
{
    public class CartController : Controller
    {
        private readonly FashionShopEntities _dbContext = new FashionShopEntities();

        // GET: Cart
        public ActionResult Index()
        {
            var cartItems = Session[Constants.ShoppingCart] as List<CartItem> ?? new List<CartItem>();

            var cartTotal = new CartTotal()
            {
                TotalMoney = cartItems.Select(x => x.Money).Sum(),
                TotalQuantity = cartItems.Select(x => x.Quantity).Sum()
            };

            var model = new CartViewModel()
            {
                CartItems = cartItems,
                CartTotal = cartTotal
            };

            return View(model);
        }

        [HttpPost]
        public JsonResult AddToCart(string variantCode, int quantity)
        {
            var variant = _dbContext.ProductVariants.FirstOrDefault(x => x.Code == variantCode);

            if (variant == null)
            {
                throw new Exception("Cannot find the product");
            }

            var cartItems = Session[Constants.ShoppingCart] as List<CartItem>;

            if (cartItems != null)
            {
                var existingItem = cartItems.FirstOrDefault(x => x.VariantCode == variantCode);
                if (existingItem != null)
                {
                    existingItem.Quantity += quantity;
                }
                else
                {
                    cartItems.Add(CreateCartItem(variantCode, quantity));
                }
            }
            else
            {
                cartItems = new List<CartItem> { CreateCartItem(variantCode, quantity) };
            }

            Session[Constants.ShoppingCart] = cartItems;

            var cartTotal = new CartTotal
            {
                TotalMoney = cartItems.Select(x => x.Money).Sum(),
                TotalQuantity = cartItems.Select(x => x.Quantity).Sum()
            };

            return Json(cartTotal, JsonRequestBehavior.AllowGet);
        }


        private CartItem CreateCartItem(string variantCode, int quantity)
        {
            var variant = _dbContext.ProductVariants.FirstOrDefault(x => x.Code == variantCode);

            if (variant != null)
            {
                var item = new CartItem
                {
                    VariantCode = variantCode,
                    Quantity = quantity,
                    ProductName = variant.Product.Name,
                    Price = variant.Product.Price,
                    //Todo: get more in db


                };

                return item;
            }

            return new CartItem();
        }

    }
}