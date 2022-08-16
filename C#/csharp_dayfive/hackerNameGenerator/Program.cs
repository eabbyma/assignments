// See https://aka.ms/new-console-template for more information

using System;

namespace MyApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter your favorite color:");
            string color = Console.ReadLine();

            Console.WriteLine("Enter your astrology sign:");
            String sign = Console.ReadLine();

            Console.WriteLine("Enter your street address number:");
            String num = Console.ReadLine();

            Console.WriteLine("Your hacker name is" + color + sign + num);
        }
    }
}