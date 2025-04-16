import React, { useContext } from 'react';
import MyContext from './MyContext';

const MyComponent = () => {
  const sharedValue = useContext(MyContext);

  return (
    <div>
      <h2>MyComponent</h2>
      <p>Shared Value: {sharedValue}</p>
    </div>
  );
};

export default MyComponent;