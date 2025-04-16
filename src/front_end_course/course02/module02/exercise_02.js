var clothes = []; // empty array

clothes.push('jacket');
clothes.push('t-shirt');
clothes.push('jeans');
clothes.push('shoes');
clothes.push('socks');

// remove the last element from the array clothes
clothes.pop();

// add a new element using the push method
clothes.push('hat');

// a console statement to show the third element in the array
console.log(clothes[2]); // jeans

// create a new empty object literal name favCar
var favCar = {};

// use dot notation to assign a color property to the favCar object
favCar.color = 'red';

// use the dot notation to assign a covertible property to the favCar object as boolean
favCar.covertible = true;

// use the console log to log the entire favCar object
console.log(favCar); // { color: 'red', covertible: true }