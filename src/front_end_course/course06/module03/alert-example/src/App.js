import React from 'react';
import './App.css';
import { useState } from 'react';

// Generic Button component
const Button = ( { children, backgroundColor, onClick }) => {
  return (
    <button style={{ backgroundColor }} onClick={onClick}>
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




function App() {
  const [showAlert, setShowAlert] = useState(false);

  const doIt = () => {
    console.log("Deleting account...");
    setShowAlert(false);
  };

  const DeleteButton = () => {
    return <Button backgroundColor="red" onClick={doIt}>Delete</Button>;
  };

  const handleDeleteAccount = () => {
    setShowAlert(true);
  }

  const DeleteAccountButton = () => {
    return <Button backgroundColor="lightgreen" onClick={handleDeleteAccount}>Delete Account!</Button>;
  };



  return (
    <div className="App">
      <header>Little Lemon Restaurant</header>
    
      <DeleteAccountButton />   
      {showAlert && 
        <Alert>
          <h4>Delete Account</h4>
          <p> Are you sure you want to proceed? You will miss all your delicious recipes!</p>
          <DeleteButton />
        </Alert>}
      
    </div>
  );
}

export default App;
