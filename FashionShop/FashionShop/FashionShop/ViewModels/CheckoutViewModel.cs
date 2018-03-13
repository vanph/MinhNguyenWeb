using System.Collections.Generic;

namespace FashionShop.ViewModels
{
    public class CheckoutViewModel
    {
        public CartViewModel Cart { get; set; }
        
        public ShippingInformationViewModel ShippingInformation { get; set; }
        
        public List<PaymentMethodViewModel> PaymentMethods { get; set; }

        /// <summary>
        /// Gets or sets whether the user is anthenticated or anonymous.
        /// </summary>
        public bool IsAuthenticated { get; set; }

        /// <summary>
        /// Gets or sets the payment redirect url.
        /// </summary>
        public string RedirectUrl { get; set; }

        
        public CheckoutViewModel()
        {
            Cart = new CartViewModel();
            ShippingInformation = new ShippingInformationViewModel();
            PaymentMethods = new List<PaymentMethodViewModel>();
        }
        
    }
}