// 1.We have an object storing salaries of our teamletsalaries = {John: 100,Ann: 160,Pete: 130}Write the code to sum all salaries and store in the variable sum. Should be 390 in the example above.
let salaries = { John: 100, Ann: 160, Pete: 130 }
function sumSalay(obj) {
    let s = 0
    for (item in obj) {
        s += obj[item]
    }
    return s
}
console.log("Sum is: ", sumSalay(salaries)) // output: Sum is:  390

// 2.Create a function multiplyNumeric(obj) that multiplies all numeric properties of obj by 2// before the callletmenu = {width: 200,height: 300,title: "My menu"};multiplyNumeric(menu);// after the callmenu = {width: 400,height: 600,title: "My menu"};Please note that multiplyNumeric does not need to return anything. It should modify the object in-place
let menu = { width: 200, height: 300, title: "My menu" };
function multiplyNumeric(menu) {
    for (i in menu) {
        if (!isNaN(menu[i])) {
            menu[i] *= 2
        }
    }
}
multiplyNumeric(menu);// after the call
console.log("multiplyNumeric", menu) // output: multiplyNumeric {width: 400, height: 600, title: 'My menu'}

// 3.Write a function checkEmailId(str) that returns true if str contains '@' and ‘.’, otherwise false. Make sure '@' must come before '.' and there must be some characters between '@' and '.'The function must be case-insensitive:
function heckEmailId(str) {
    if (!str.includes("@") && !str.includes('.')) {
        return false
    }
    for (let i = 0; i < str.length; i++) {
        if (str[i] === ".") {
            return false
        }
        if (str[i] === "@" && str[i + 1] != ".") {
            return true
        }
    }
    return false
}
const test1 = heckEmailId("@.") // false
const test2 = heckEmailId("@ .") // true
const test3 = heckEmailId(". @") // false
console.log(test1, test2, test3)

// 4.Create a function truncate(str, maxlength) that checks the length of the str and, if it exceeds maxlength–replaces the end of str with the ellipsis character "...", to make its length equal to maxlength.The result of the function should be the truncated (if needed) string.truncate("What I'd like to tell on this topic is:", 20) = "What I'd like to te..."truncate("Hi everyone!", 20) = "Hi everyone!"
function truncate(str, maxlength) {
    if (str.length <= maxlength) {
        return str
    } {
        return str.slice(0, maxlength) + "..."
    }
}
const t1 = truncate("What I'd like to tell on this topic is:", 20)  // What I'd like to tel...
const t2 = truncate("Hi everyone!", 20)
console.log(t1, t2)

// 5.Let’s try 5 array operations.
// Create an array styles with items “James” and “Brennie”.
let arr = ["James", "Brennie"] // ['James', 'Brennie']
// Append “Robert” to the end.
arr.push("Robert") // ['James', 'Brennie', 'Robert']
// Replace the value in the middle by “Calvin”. Your code for finding the middle value should work for any arrays with odd length.
if (arr.length % 2 === 1) {
    arr[Math.floor(arr.length / 2)] = "Calvin"
} // ['James', 'Calvin', 'Calvin']
// Remove the first value of the array and show it.
const removedItem = arr.shift()
console.log("Show removed item: ", removedItem) // 'James'
// Prepend Rose and Regal to the array.
arr.unshift("Rose", "Regal")
console.log("arr: ", arr) // ['Rose', 'Regal', 'Calvin', 'Robert']
