using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FashionShop.ViewModels
{
    public class CartViewModel
    {
        public List<CartItem> CartItems { get; set; }

        public CartTotal CartTotal { get; set; }

        public CartViewModel()
        {
            CartItems = new List<CartItem>();
            CartTotal = new CartTotal();
        }
        
    }

   

}