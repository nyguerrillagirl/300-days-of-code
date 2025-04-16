import MyButton from "./components/MyButton";
import ShoppingList from "./components/ShoppingList";
import { useState } from 'react';

const user = {
  name: 'Hedy Lamarr',
  imageUrl: 'https://i.imgur.com/yXOvdOSs.jpg',
  imageSize: 90,
};

export default function Profile() {
  const [count, setCount] = useState(0);

  function handleClick() {
    setCount(count + 1);
  }


  return (
    <div>
      <h1>{user.name}</h1>
      <img
        className="avatar"
        src={user.imageUrl}
        alt={'Photo of ' + user.name}
        style={{
          width: user.imageSize,
          height: user.imageSize
        }}
      />
      <ShoppingList />
      <div>
        <MyButton count={count} onClick={handleClick} />
        <MyButton  count={count} onClick={handleClick}/>
      </div>
    </div>
  );
}