function DessertsList(props) {
  let lowCalorieDesserts = props.data.filter((dessert) => dessert.calories < 500);
  lowCalorieDesserts.sort((a, b) => a.calories - b.calories);
  return (
    <ul>
      {lowCalorieDesserts.map((dessert) => (
        <li key={dessert.name}>
          {dessert.name} - {dessert.calories} cal
        </li>
      ))}
    </ul>
  );
}

export default DessertsList;
