/*
The reduce() method in JavaScript iterates over an array and accumulates its 
elements into a single value. It takes two arguments: a callback function and 
an optional initial value. 

The callback function itself takes two arguments: an accumulator and the current 
element being processed. On each iteration, the callback function is executed, 
and its return value becomes the new value of the accumulator for the next 
iteration. If an initial value is provided, it is used as the starting value of
the accumulator. Otherwise, the first element of the array is used as the 
initial value, and the iteration starts from the second element.

After the last element has been processed, the reduce() method returns the 
final value of the accumulator. It's important to note that the reduce() method 
does not modify the original array.
*/

const numbers = [1, 2, 3, 4, 5];

const sum = numbers.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
console.log(sum); // Output: 15

const product = numbers.reduce((accumulator, currentValue) => accumulator * currentValue, 1);
console.log(product) // Output: 120