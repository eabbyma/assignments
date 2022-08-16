// See https://aka.ms/new-console-template for more information

// Write program to enter an integer number of centuries and convert it to years, days, hours,
// minutes, seconds, milliseconds, microseconds, nanoseconds. Use an appropriate data
// type for every data conversion. Beware of overflows!
// Input: 1
// Output: 1 centuries = 100 years = 36524 days = 876576 hours = 52594560 minutes
// = 3155673600 seconds = 3155673600000 milliseconds = 3155673600000000
// microseconds = 3155673600000000000 nanoseconds
// Input: 5
// Output: 5 centuries = 500 years = 182621 days = 4382904 hours = 262974240
// minutes = 15778454400 seconds = 15778454400000 milliseconds = 15778454400000000
// microseconds = 15778454400000000000 nanoseconds

using System;
class Program
{
    static void Main(string[] args)
    {
        // Initalize constant variables
        int UNIT_CENTRY = 100;
        int UNIT_DAY = 365;
        int UNIT_TIME = 60;
        int UNIT_HOUR = 24;

        // Prompt user for input
        Console.WriteLine("Enter Integer: ");

        // Store input to a variable
        int userinput = Convert.ToInt32(Console.ReadLine());


        int centuries = userinput * UNIT_CENTRY;
        int years = centuries * UNIT_DAY;
        int days = years * UNIT_DAY;
        int hours = days * UNIT_HOUR;
        int minutes = hours * UNIT_TIME;
        int seconds = checked(minutes * UNIT_TIME);
        long milliseconds = checked(seconds * UNIT_TIME);
        long microseconds = checked(milliseconds * UNIT_TIME);
        long nanoseconds = checked(microseconds * UNIT_TIME);

        Console.WriteLine("centuries =" + centuries + '\n' + "years =" + years + "\n" + "days =" + days + "\n" + "hours =" + hours + "\n" + "minutes =" + minutes + "\n" + "seconds =" + seconds + '\n' + "milliseconds =" + milliseconds + "\n" + "microseconds =" + microseconds + "\n" + "nanoseconds =" + nanoseconds );

    }
}
