using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccess;
using FashionShop.Common;
using FashionShop.ViewModels;

namespace FashionShop.Services
{
    public class CartService :ICartService
    {
        private readonly FashionShopEntities _dbContext;

        public CartService(FashionShopEntities dbContext)
        {
            _dbContext = dbContext;
        }
        public CartViewModel GetCurrentCart()
        {
            var cartItems = System.Web.HttpContext.Current.Session[Constants.ShoppingCart] as List<CartItem> ?? new List<CartItem>();

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

            return model;
        }

        public CartTotal AddToCart(string variantCode, int quantity)
        {
            var variant = _dbContext.ProductVariants.FirstOrDefault(x => x.Code == variantCode);

            if (variant == null)
            {
                throw new Exception("Cannot find the product");
            }

            var cartItems = System.Web.HttpContext.Current.Session[Constants.ShoppingCart] as List<CartItem>;

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

            System.Web.HttpContext.Current.Session[Constants.ShoppingCart] = cartItems;

            var cartTotal = new CartTotal
            {
                TotalMoney = cartItems.Select(x => x.Money).Sum(),
                TotalQuantity = cartItems.Select(x => x.Quantity).Sum()
            };

            return cartTotal;
        }


        private CartItem CreateCartItem(string variantCode, int quantity)
        {
            var variant = _dbContext.ProductVariants.FirstOrDefault(x => x.Code == variantCode);

            if (variant != null)
            {
                var item = new CartItem
                {
                    ProductVariantId = variant.ProductVariantId,
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


        public void ClearCurrentCart()
        {
            System.Web.HttpContext.Current.Session[Constants.ShoppingCart] = null;
        }
    }
}