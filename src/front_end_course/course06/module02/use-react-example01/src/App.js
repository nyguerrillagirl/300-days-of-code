import { useState } from 'react';

function App() {
  const [greeting, setGreeting] = useState({ greet: "Hello", place: "World" });
  console.log(greeting, setGreeting);

  function updateGreeting() {
    setGreeting(prevState => {
      return { ...prevState, greet: "Hello, World-Wide Web" };
    });
  }

  function updateGreeting2() {
      // This will generate TypeError since greeting is a const!
      greeting = {greet: "Hello, World-Wide Web"};
      setGreeting(greeting); 
  
  }

  function updateGreeting3() {
    // This does not work 
    greeting.greet = "Hello, World-Wide Web";
    setGreeting(greeting); 

}

  return (
    <div className="App">
      <h1>Use React Example 01</h1>
      <h2>{greeting.greet}, {greeting.place}</h2>
      <button onClick={updateGreeting}>Update Greeting</button>
    </div>
  );
}

export default App;
