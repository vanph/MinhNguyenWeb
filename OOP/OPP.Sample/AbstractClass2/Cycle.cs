namespace AbstractClass2
{
    public class Cycle : Shape
    {
      
        public int Redius { get; set; }

        public Cycle(int redius)
        {
            Redius = redius;
        }
        public override decimal GetArea() => Redius * Redius * 3.14m;
    }
}