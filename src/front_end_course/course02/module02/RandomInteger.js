// Get a random integer between 1 and 0.99
var decimal = Math.random() * 10; // 0.0 to 9.99
console.log(decimal);

// Rounding up the value of decimal 1..10
//var rounded = Math.ceil(decimal);



var counterArr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

for (var i = 0; i < 1000; i++) {
    var random = Math.round(Math.random() * 10);
    counterArr[random]++;
}   

// print the counterArr
console.log(counterArr);

// The index of 0 is not possible when using ceil
