using System.Web.Mvc;
using DataAccess;
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
            //Get ShippingAddress if logged  ( default ShippingAddress = address of customer)
            //Get Payment method
            var model = new CheckoutViewModel()
            {
                Cart = _cartService.GetCurrentCart()
            };

            return model;
        }


        [HttpPost]
        public ActionResult Purchase(CheckoutViewModel viewModel)
        {
            if (viewModel?.Cart == null || viewModel.Cart.CartItems.Count ==0)
            {
                return RedirectToAction("Index", "Home");
            }
            
            viewModel.IsAuthenticated = User.Identity.IsAuthenticated;

            //Todo: implement place order

            return View("Index",viewModel);
        }
    }
}