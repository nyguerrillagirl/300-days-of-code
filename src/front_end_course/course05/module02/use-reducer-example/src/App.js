
import './App.css';
import { useReducer } from 'react';

function reducer(state, action) {
  console.log('state:', state);
  console.log('action:', action);
  switch (action.type) {
    case 'increment':
      return { ...state, count: state.count + 1 };
    case 'decrement':
      return { ...state, count: state.count - 1 };
    case 'reset':
      return { ...state, count: 0 };
    default:
      return "Unrecognized action type";
  } 
}

const initialState = { count: 0 };

function App() {
  const [state, dispatch] = useReducer(reducer, initialState);

  function handleIncrement() {
    dispatch({ type: 'increment' });
  }

  function handleDecrement() {
    dispatch({ type: 'decrement' });
  }

  function handleReset() {
    dispatch({ type: 'reset' });
  }

  return (
    <div className="App">
      <header className="App-header">
        <h1>Counter: {state.count}</h1>
        <button onClick={handleIncrement}>Increment</button>
        <button onClick={handleDecrement}>Decrement</button>
        <button onClick={handleReset}>Reset</button>
      </header>
    </div>
  );
}

export default App;
