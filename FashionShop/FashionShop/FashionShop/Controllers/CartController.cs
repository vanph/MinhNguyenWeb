using System.Web.Mvc;
using DataAccess;
using FashionShop.Services;

namespace FashionShop.Controllers
{
    public class CartController : Controller
    {
        private readonly ICartService _cartService;

        public CartController( )
        {
            _cartService = new CartService(new FashionShopEntities());
        }
        // GET: Cart
        public ActionResult Index()
        {
            var cart = _cartService.GetCurrentCart();

            return View(cart);
        }

        [HttpPost]
        public JsonResult AddToCart(string variantCode, int quantity)
        {
            var cartTotal = _cartService.AddToCart(variantCode, quantity);

            return Json(cartTotal, JsonRequestBehavior.AllowGet);
        }
        
    }
}