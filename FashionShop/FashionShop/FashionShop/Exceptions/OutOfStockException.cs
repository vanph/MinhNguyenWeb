using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FashionShop.Exceptions
{
    public class OutOfStockException: Exception
    {
        public OutOfStockException(string errorMessage):base(errorMessage)
        {
        }
    }
}