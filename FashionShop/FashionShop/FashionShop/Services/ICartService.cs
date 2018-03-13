using FashionShop.ViewModels;

namespace FashionShop.Services
{
    public interface ICartService
    {
        CartViewModel GetCurrentCart();

        CartTotal AddToCart(string variantCode, int quantity);

        void ClearCurrentCart();
    }
}