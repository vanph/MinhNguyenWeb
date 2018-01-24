using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AbstractClass2
{
    
    class Program
    {
        static void Main(string[] args)
        {
            Shape s1 = new Square(4);

            Console.WriteLine(s1.GetType()); //16

            Console.WriteLine(s1.GetArea()); //16

            var s12 = (Square) s1;
            Console.WriteLine("Side:" + s12.Side);

            var s11 = new Square(5);
            Console.WriteLine($"Square for {s11.Side}: {s11.GetArea()}");

            IShape s2 = new Rectangle(2,3);

            Console.WriteLine(s2.GetArea());//6

          

            Console.ReadKey();
        }
    }
}
