using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AbstractClass2
{
    public class Square:Shape
    {

        public int Side { get; set; }

        public Square(int side)
        {
            Side = side;
        }

        public override decimal GetArea() => Side * Side;
    }
}
