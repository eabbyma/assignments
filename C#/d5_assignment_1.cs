
// Name: E Ma
// Email: eaabyma@gmail.com

01 Introduction to C# and Data Types 

PART 1 --------- Understanding Data Types | Test your Knowledge

1. What type would you choose for the following “numbers”?

A person’s telephone number - String 
A person’s height - Float
A person’s age - Integer
A person’s gender (Male, Female, Prefer Not To Answer) - String 
A person’s salary - Float
A book’s ISBN - String
A book’s price - Float 
A book’s shipping weight - Float
A country’s population - Integer
The number of stars in the universe - Integer
The number of employees in each of the small or medium businesses in the 
United Kingdom (up to about 50,000 employees per business) - Integer

2. What are the difference between value type and reference type variables? 
What is boxing and unboxing?

A Value Type holds the data within its own memory allocation and 
a Reference Type contains a pointer to another memory location that holds the real data.

Boxing is the process of converting a value type to the type object or to any interface type implemented by this value type. 
Unboxing is an explicit conversion from the type object to a value type or from an interface type to a value type that implements the interface. 

3. What is meant by the terms managed resource and unmanaged resource in .NET
Managed resources are those that are pure . NET code and managed by the runtime and are under its direct control. 
Unmanaged resources are those that run outside the . NET runtime (CLR)(aka non-. NET code.) 

4. Whats the purpose of Garbage Collector in .NET?
. NET's garbage collector manages the allocation and release of memory for your application. 
Each time you create a new object, the common language runtime allocates memory for the object from the managed heap.

PART 2 --------- Playing with Console App

Modify your console application to display a different message. Go ahead and
intentionally add some mistakes to your program, so you can see what kinds of error
messages you get from the compiler. The more familiar you are with these messages, and
what causes them, the better you'll be at diagnosing problems in your programs that you /
didn't/ intend to add!
Using just the ReadLine and WriteLine methods and your current knowledge of variables,
you can have the user pass in quite a few bits of information. Using this approach, create a
console application that asks the user a few questions and then generates some custom
output for them. For instance, your program could generate their "hacker name" by asking
them their favorite color, their astrology sign, and their street address number. The result
might be something like "Your hacker name is RedGemini480."

Practice number sizes and ranges

1. Create a console application project named /02UnderstandingTypes/ that outputs the
number of bytes in memory that each of the following number types uses, and the
minimum and maximum values they can have: sbyte, byte, short, ushort, int, uint, long,
ulong, float, double, and decimal.
Composite Formatting to learn how to align text in a console application

2. Write program to enter an integer number of centuries and convert it to years, days, hours,
minutes, seconds, milliseconds, microseconds, nanoseconds. Use an appropriate data
type for every data conversion. Beware of overflows!
Input: 1
Output: 1 centuries = 100 years = 36524 days = 876576 hours = 52594560 minutes
= 3155673600 seconds = 3155673600000 milliseconds = 3155673600000000
microseconds = 3155673600000000000 nanoseconds
Input: 5
Output: 5 centuries = 500 years = 182621 days = 4382904 hours = 262974240
minutes = 15778454400 seconds = 15778454400000 milliseconds = 15778454400000000
microseconds = 15778454400000000000 nanoseconds

PART 3 --------- Explore following topics

C# Keywords
Main() and command-line arguments
Types (C# Programming Guide)
Statements, Expressions, and Operators
Strings (C# Programming Guide)
Nullable Types (C# Programming Guide)
Nullable reference types
Controlling Flow and Converting Types

PART 4 --------- Test your Knowledge

1. What happens when you divide an int variable by 0?
Exception: DivideByZeroException

2. What happens when you divide a double variable by 0?

3. What happens when you overflow an int variable, that is, set it to a value beyond its
range?

4. What is the difference between x = y++; and x = ++y;?

5. What is the difference between break, continue, and return when used inside a loop
statement?

6. What are the three parts of a for statement and which of them are required?
