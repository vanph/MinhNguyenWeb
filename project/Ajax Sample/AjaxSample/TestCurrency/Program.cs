using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestCurrency
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.OutputEncoding = System.Text.Encoding.UTF8;

            var number = 100;

            var result = CurrencyHelper.ToVnCurrencyString(number);

            Console.WriteLine(result);

            Console.ReadLine();

        }
    }
}
