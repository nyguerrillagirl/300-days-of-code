const menu = [
    {
        dishName : "Italian pasta",
        price: 9.55
    },
    {
        dishName : "Rice with veggies",
        price: 8.65
    },
    { 
        dishName : "Chicken with potatoes",
        price: 15.55
    },
    {
        dishName : "Vegetarian Pizza",
        price: 6.45
    }
]

function printMenu(withTaxCalculated) {
    taxCalculation = withTaxCalculated ? 0.20 : 0.0;
    const headerPrice = withTaxCalculated ? "Price with 20% tax:" : "Prices without tax:";
    console.log(headerPrice);
    for (let i = 0; i < menu.length; i++) {
        const dish = menu[i];
        const price = dish.price;
        const tax = price * taxCalculation;
        const totalPrice = price + tax;

        console.log(`Dish: ${dish.dishName} Price (incl.tax): $${totalPrice} `);
    }
}

printMenu(false);