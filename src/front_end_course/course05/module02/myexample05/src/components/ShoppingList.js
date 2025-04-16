const products = [
    { title: 'Cabbage', isFruit: false, id: 1 },
    { title: 'Apple', isFruit: true, id: 2 },
    { title: 'Banana', isFruit: true, id: 3 },
    { title: 'Carrot', isFruit: false, id: 4 },
    { title: 'Garlic', isFruit: false, id: 5 }

];

export default function ShoppingList() {
    const listItems = products.map((product) =>
        <li key={product.id}
            style={{ color: product.isFruit ? 'magenta' : 'darkgreen' }}>
            {product.title}
        </li>
    );

    return (
        <ul>
            {listItems}
        </ul>
    )
}