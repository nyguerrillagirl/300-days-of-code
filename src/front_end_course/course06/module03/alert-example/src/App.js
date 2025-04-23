import React from 'react';
import './App.css';
// Generic Button component
const Button = ( { children, backgroundcolor }) => {
  return (
    <button style={{ backgroundColor: backgroundcolor }}>
      {children}
    </button>
  );
};

const Alert = ( { children } ) => {

  return (
    <>
      <div className="Overlay" />
      <div className="Alert">{children}</div>
    </>
  );
};

const DeleteButton = () => {
  return <Button backgroundColor="red">DeleteButton</Button>;
};


function App() {
  return (
    <div className="App">
      <header>Little Lemon Restaurant</header>
      <Alert>

      </Alert>
    </div>
  );
}

export default App;
