using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FashionShop.ViewModels
{
    public class AddressViewModel
    {
        public int Phone { get; set; }

        public string LineAddress { get; set; }
        
        public string District { get; set; }
        
        public string City { get; set; }
    }
}