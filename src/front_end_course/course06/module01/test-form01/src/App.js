import React, { useRef } from 'react';
import './App.css';

const Form = () => { 
  const fileInput = useRef(null); 
 
  const handleSubmit = (e) => { 
    e.preventDefault(); 
    const files = fileInput.current.files; 
    // Do something with the files here 
  } 
 
  return ( 
    <form onSubmit={handleSubmit}> 
      <input 
        ref={fileInput} 
        type="file" 
      /> 
    </form> 
  ); 
 }; 

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <Form />
      </header>
    </div>
  );
}

export default App;
