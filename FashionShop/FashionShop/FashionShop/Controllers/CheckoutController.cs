using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using DataAccess;
using FashionShop.Enumerations;
using FashionShop.Services;
using FashionShop.ViewModels;

namespace FashionShop.Controllers
{
    public class CheckoutController : Controller
    {
        private readonly FashionShopEntities _dbContext;
        private readonly ICartService _cartService;

        public CheckoutController()
        {
            _dbContext = new FashionShopEntities();
            _cartService = new CartService(_dbContext);
                
        }
        // GET: Checkout
        public ActionResult Index()
        {
            var viewModel = CreateCheckoutViewModel();
            

            return View(viewModel);
        }

        private CheckoutViewModel CreateCheckoutViewModel()
        {
            //Todo:
            //Get ShippingInformation if logged  ( default ShippingInformation = address of customer)
            //Get Payment method
            var paymentMethodViewModels = _dbContext.PaymentMethods.Select(x => new PaymentMethodViewModel()
            {
                PaymentMethodId = x.PaymentMethodId,
                PaymentMethodName = x.PaymentMethodName,
                Description = x.Description
            }).ToList();

            var model = new CheckoutViewModel()
            {
                Cart = _cartService.GetCurrentCart(),
                PaymentMethods = paymentMethodViewModels,
                ShippingInformation = new ShippingInformationViewModel()
            };

            return model;
        }


        [HttpPost]
        public ActionResult Purchase(ShippingInformationViewModel shippingInformation)
        {
            var checkoutViewModel = CreateCheckoutViewModel();
            checkoutViewModel.ShippingInformation = shippingInformation;

            if (ModelState.IsValid)
            {
                var cart = checkoutViewModel.Cart;

                if (cart.CartItems.Count == 0)
                {
                    ModelState.AddModelError("Purchase", "There is empty cart");

                    View("Index", checkoutViewModel);
                }
                
               var orderId = PlaceOrder(shippingInformation, cart);

                //clear cart
                _cartService.ClearCurrentCart();
               
                return RedirectToAction("Index", "OrderConfirmation"); //orderId

            }
            return View("Index", checkoutViewModel);
        }

        private Guid PlaceOrder(ShippingInformationViewModel shippingInformation, CartViewModel cart)
        {
            //check quantity of cart items in store

            var order = new Order
            {
                OrderId = Guid.NewGuid() ,
                FullName = shippingInformation.FullName,
                EmailAdress = shippingInformation.EmailAddress,
                Phone = shippingInformation.Phone,
                LineAddress = shippingInformation.LineAddress,
                District = shippingInformation.District,
                City = shippingInformation.City,
                Note = shippingInformation.Note,
                PaymentMethodId = shippingInformation.PaymentMethodId,
                Amount = cart.CartTotal.TotalMoney,
                AmountPaint = 0,
                OrderStatusId = (int) OrderStatusEnum.New,
                CreatedDate = DateTime.Now,
                CreateBy = shippingInformation.EmailAddress,
                ModifiedDate = DateTime.Now,
                ModifiedBy = shippingInformation.EmailAddress
            };

            var orderDetails = new List<OrderDetail>();

            foreach (var cartItem in cart.CartItems)
            {
                var orderDetail = new OrderDetail
                {
                    OrderDetailId = Guid.NewGuid(),
                    OrderId = order.OrderId,
                    Quantity = cartItem.Quantity,
                    UnitPrice = cartItem.Price,
                    ProductVariantId = cartItem.ProductVariantId,
                    CreatedDate = DateTime.Now,
                    CreatedBy = shippingInformation.EmailAddress,
                    ModifiedDate = DateTime.Now,
                    ModifiedBy = shippingInformation.EmailAddress
                };

                orderDetails.Add(orderDetail);
            }

            _dbContext.Orders.Add(order);
            _dbContext.OrderDetails.AddRange(orderDetails);
            //get variants => Variant.Quantity = Variant.Quantity - cartItem.Quantity
            _dbContext.SaveChanges();

            return order.OrderId;
        }
    }
}