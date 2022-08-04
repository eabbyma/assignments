

using System;
class Program
{
    static void Main(string[] args)
    {
        // CopyArray();
        // ManageList();
        // FindPrimesInRange(1, 10);
        // ReverseWords("/Yes! Really!!!/");
        FindPalindromes("Hi,exe? ABBA! Hog fully a string: ExE. Bob");
    }
    // Write code to create a copy of an array. First, start by creating an initial array. (You can use
    // whatever type of data you want.) Let’s start with 10 items. Declare an array variable and
    // assign it a new array with 10 items in it. Use the things we’ve discussed to put some values
    // in the array.
    // Now create a second array variable. Give it a new array with the same length as the first.
    // Instead of using a number for this length, use the Lengthproperty to get the size of the
    // original array.
    // Use a loop to read values from the original array and place them in the new array. Also
    // print out the contents of both arrays, to be sure everything copied correctly.
    static void CopyArray()
    {
        int[] array1 = new int[10];
        int[] array2 = new int[] { 1, 3, 5, 7, 9, 20, 2, 6, 6, 8 };
        int[] array3 = new int[10];
        for (int i = 0; i < array1.Length; i++)
        {
            int original_value = array2[i];
            Console.WriteLine("Content: " + original_value);
            array3[i] = original_value;
        }
    }

    // 2. Write a simple program that lets the user manage a list of elements. It can be a grocery list,
    // "to do" list, etc. Refer to Looping Based on a Logical Expression if necessary to see how to
    // implement an infinite loop. Each time through the loop, ask the user to perform an
    // operation, and then show the current contents of their list. The operations available should
    // be Add, Remove, and Clear. The syntax should be as follows:
    // + some item
    // - some item
    // --
    // Your program should read in the user's input and determine if it begins with a “+” or “-“ or
    // if it is simply “—“ . In the first two cases, your program should add or remove the string
    // given ("some item" in the example). If the user enters just “—“ then the program should
    // clear the current list. Your program can start each iteration through its loop with the
    // following instruction:
    // Console.WriteLine("Enter command (+ item, - item, or -- to clear)):");

    static void ManageList()
    {
        List<string> list = new List<string>();
        Console.Write("Enter command (+ item, - item or -- to clear): ");
        string operation = Console.ReadLine(); while (operation != null)
        {
            switch (operation)
            {
                case "+":
                    Console.Write("Please enter the element: ");
                    list.Add(Console.ReadLine());
                    Console.WriteLine($"The current list is: ");
                    foreach (var item in list)
                    {
                        Console.Write(item + "\t");
                    }
                    Console.WriteLine();
                    break;
                case "-":
                    list.RemoveAt(list.Count - 1);
                    Console.WriteLine($"The current list is: {list}");
                    Console.WriteLine($"The current list is: ");
                    foreach (var item in list)
                    {
                        Console.Write(item + "\t");
                    }
                    Console.WriteLine(); break;
                case "--":
                    list.Clear();
                    Console.WriteLine("You have removed all the elements");
                    break;
                default:
                    Console.WriteLine("Invalid operation");
                    break;
            }
            Console.WriteLine("Insert another input to Continue: ");
            operation = Console.ReadLine();
        }
    }

    static int[] FindPrimesInRange(int startNum, int endNum)
    {
        List<int> result = new List<int>();
        for (int i = startNum; i < endNum; i++)
        {
            for (int j = 2; j < endNum; j++)
            {
                if (i % j == 0)
                {
                    break;
                }
            }
            result.Add(i);
        }
        Console.WriteLine("Result", result);
    }

    public int[] RotateSum(int[] arr, int k)
    {
        int[] result = { };
        for (int i = 0; i < Array.MaxLength; i++)
        {
            if (i + k < Array.Length)
            {
                result.Add(arr[i] + arr[i + k]);
            }
            result.Add(arr[i] + arr[k - i]);

        }
        Console.WriteLine("Result", result);
    }

    public int[] LongestSeq(int[] arr)
    {
        int count = 1;
        int longestNum = numbers[0];
        int longestCount = 1;

        for (int i = 1; i < numbers.Length; i++)
        {
            if (numbers[i] != numbers[i - 1])
            {
                count = 0;
            }
            count++;
            if (count > longestCount)
            {
                longestCount = count;
                longestNum = numbers[i];
            }
        }
        Console.WriteLine(string.Join(" ", Enumerable.Repeat(longestNum, longestCount)));
        int[] result = new int[longestCount];
        Array.Fill(result, longestNum);
    }

    pulic findMostFrequentElement(int[] Arr)
    {
        int max_freq = 0;
        int ans = -1;
        int n = Arr.Length;
        for (int i = 0; i < n; i++)
        {
            int curr_freq = 1;
            for (j = i + 1; j < n; j++)
                if (Arr[j] == Arr[i])
                    curr_freq = curr_freq + 1;

            if (max_freq < curr_freq)
            {
                max_freq = curr_freq;
                ans = Arr[i];
            }
            else if (max_freq == curr_freq)
                ans = min(ans, Arr[i]);
        }
        Console.WriteLine(ans);
    }

    public string ReverseStringOne(string s)
    {
        if (s == null)
        {
            return string.Empty;
        }
        char[] chars = s.ToCharArray();
        for (int i = 0, j = chars.Length - 1; i < j; i++, j--)
        {
            char c = chars[i]; chars[i] = chars[j]; chars[j] = c;
        }
        string res = new string(chars); return res;
    }

    static static string ReverseWords(string str)
    {
        return String.Join(" ", str.Split('.', ' ').Reverse()).ToString();
    }

    static static string FindPalindromes(string str)
    {
        string[] words = str.Split(',', ' ');
        foreach (string w in words)
        {
            if (w == w.Reverse())
            {
                Console.WriteLine(words);
            }
        }
    }

    public void ParseUrl(string url)
    {
        char[] seperator = new char[] { ':', '/', '/' };
        int i = url.IndexOfAny(seperator);
        string protocal, secondHalf;
        if (i != -1)
        {
            protocal = url.Substring(0, i);
            secondHalf = url.Substring(i + 3);
        }
        else { protocal = " "; secondHalf = url; }
        string[] temp = secondHalf.Split('/');
        string server = temp[0];
        string resource;
        if (temp.Length > 1) { resource = temp[1]; }
        else { resource = " "; }
        Console.WriteLine($"[protocal] = {protocal}");
        Console.WriteLine($"[server] = {server}");
        Console.WriteLine($"[resource] = {resource}");
    }


}


