import './App.css';
import MyComponent from './MyComponent';
import MyContext from './MyContext';

function App() {
  const sharedValue = "This is a shared value";

  return (
    <MyContext.Provider value={sharedValue}>
      <div className="App">
        <h1>React Context API - Example</h1>
        <MyComponent />
      </div>
      </MyContext.Provider>
  );
}

export default App;
