// See https://aka.ms/new-console-template for more information
using System;


// 1. Create a console application project named /02UnderstandingTypes/ that outputs the
// number of bytes in memory that each of the following number types uses, and the
// minimum and maximum values they can have: sbyte, byte, short, ushort, int, uint, long,
// ulong, float, double, and decimal.
// Composite Formatting to learn how to align text in a console application

class Program
{
    static void Main(string[] args)
    {
        sbyte sbyte_ = -12;
        byte byte_ = 2;
        short short_ = 2;
        ushort ushort_ = 2;
        int intVar = 100;
        uint ui = 100u;
        float fl = 10.2f;
        long l = 45755452222222L;
        ulong ul = 45755452222222ul;
        double d = 11452222.555d;
        decimal mon = 1000.15m;


        string[] types = { "sbyte", "byte", "short", "ushort", "int", "uint", "long",
"ulong", "float", "double", "decimal"};

        object[] allvalues = { sbyte_, byte_, intVar, short_, ushort_, intVar, ui, fl, l, ul, d, mon };

        foreach (var ty in allvalues)
        {
            Console.WriteLine(ty.GetType());
            // Console.WriteLine(ty.MinValue);
            // Console.WriteLine("Number of bytes in memory:" + sizeof(ty.GetType()));
            // Console.WriteLine("Minimum value: " + ty.GetType().MinValue);
            // Console.WriteLine("Maximum value: " + ty.GetType().MaxValue);
        }

        Console.WriteLine("sbyte - Number of bytes in memory: 8 bits" + "| Minimum value: " + sbyte.MinValue + "| Maximum value: " + sbyte.MaxValue);
        Console.WriteLine("byte - Number of bytes in memory: 8 bits" + "| Minimum value: " + byte.MinValue + "| Maximum value: " + byte.MaxValue);
        Console.WriteLine("short - Number of bytes in memory: 16 bits" + "| Minimum value: " + short.MinValue + "| Maximum value: " + short.MaxValue);
        Console.WriteLine("ushort - Number of bytes in memory: 16 bits" + "| Minimum value: " + ushort.MinValue + "| Maximum value: " + ushort.MaxValue);
        Console.WriteLine("int - Number of bytes in memory: 32 bits" + "| Minimum value: " + int.MinValue + "| Maximum value: " + int.MaxValue);
        Console.WriteLine("uint - Number of bytes in memory: 32 bits" + "| Minimum value: " + uint.MinValue + "| Maximum value: " + uint.MaxValue);
        Console.WriteLine("long - Number of bytes in memory: 64 bits" + "| Minimum value: " + long.MinValue + "| Maximum value: " + long.MaxValue);
        Console.WriteLine("ulong - Number of bytes in memory: 64 bits" + "| Minimum value: " + ulong.MinValue + "| Maximum value: " + ulong.MaxValue);
        Console.WriteLine("float - Number of bytes in memory: 32 bits" + "| Minimum value: " + float.MinValue + "| Maximum value: " + float.MaxValue);
        Console.WriteLine("double - Number of bytes in memory: 64 bits" + "| Minimum value: " + double.MinValue + "| Maximum value: " + double.MaxValue);
        Console.WriteLine("decimal - Number of bytes in memory: 128 bits" + "| Minimum value: " + decimal.MinValue + "| Maximum value: " + decimal.MaxValue);
    }
}

