using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using FashionShop.Enumerations;

namespace FashionShop.ViewModels
{
    public class ShippingInformationViewModel
    {
        [Required]
        public string FullName { get; set; }

        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string EmailAddress { get; set; }

        [Required]
        public string Phone { get; set; }

        [Required]
        [StringLength(250)]
        public string LineAddress { get; set; }

        [Required]
        [StringLength(50)]
        public string District { get; set; }

        [Required]
        [StringLength(50)]
        public string City { get; set; }

        public int PaymentMethodId { get; set; }
        
        public  string Note { get; set; }

        public ShippingInformationViewModel()
        {
            PaymentMethodId = (int) PaymentMethodEnum.Cod;
        }
    }
}