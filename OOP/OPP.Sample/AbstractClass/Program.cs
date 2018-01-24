using System;

namespace AbstractClass
{
    class Program
    {
        static void Main(string[] args)
        {
            var objD = new D() {Name = "Minh"};
            objD.Print(5);
          //result objD
     
           //Print
            var objE = new E() { Name = "Van" };
            objE.Print(10);
            //result objE
            //Class E Print
            //

            Console.ReadKey();
        }
    }

    public abstract class A
    {
        //Class members
        private int _side;
        public string Name { get; set; }

        public virtual void Print(int i)
        {
            Console.WriteLine(Name + i);
            DoWork(i);
        }

        protected abstract void DoWork(int i);
    }

    public sealed class D : A
    {
        protected override void DoWork(int i)
        {
            Console.WriteLine("Class D dowork:" + i);
        }

        public override void Print(int i)
        {
            Console.WriteLine("Print");
        }
    }

 
    public class E : A
    {
        protected override void DoWork(int i)
        {
            Console.WriteLine("Class E test:" + i);
        }

        public override void Print(int i)
        {
            Console.WriteLine("Class E Print");
            base.Print(i);
        }
    }

    public class F : E
    {
        
    }
}
