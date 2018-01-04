namespace FashionShop.ViewModels
{
    public class HeaderViewModel
    {
        public CartTotal CartTotal { get; set; }

        public HeaderViewModel()
        {
            CartTotal = new CartTotal();
        }
    }
}