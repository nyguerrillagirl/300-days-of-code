import { useRef } from 'react';
import './App.css';

function App() {
  const inputRef = useRef(null);
  const resultRef = useRef(null);

  // Handle number button clicks
  const handleNumber = (num) => {
    if (inputRef.current) {
      inputRef.current.value += num;
    }
  };

  // Handle operation button clicks
  const handleOperation = (op) => {
    if (inputRef.current) {
      inputRef.current.value += op;
    }
  };

  // Calculate result
  const calculateResult = () => {
    if (inputRef.current && resultRef.current) {
      try {
        const calcResult = eval(inputRef.current.value);
        resultRef.current.textContent = `Result: ${calcResult}`;
      } catch (error) {
        resultRef.current.textContent = 'Result: Error';
      }
    }
  };

  // Clear everything
  const clearAll = () => {
    if (inputRef.current && resultRef.current) {
      inputRef.current.value = '';
      resultRef.current.textContent = 'Result:';
    }
  };

  return (
    <>
      <h1>My Calculator</h1>
      <input 
        type="text" 
        ref={inputRef}
        placeholder="0"
      />
      <div className='container'>
        <button onClick={() => handleOperation('+')}>+</button>
        <button onClick={() => handleOperation('-')}>-</button>
        <button onClick={() => handleOperation('*')}>*</button>
        <button onClick={() => handleOperation('/')}>/</button>
        <button onClick={clearAll}>Clear</button>
        <button onClick={() => handleNumber('1')}>1</button>
        <button onClick={() => handleNumber('2')}>2</button>
        <button onClick={() => handleNumber('3')}>3</button>
        <button onClick={() => handleNumber('4')}>4</button>
        <button onClick={() => handleNumber('5')}>5</button>
        <button onClick={() => handleNumber('6')}>6</button>
        <button onClick={() => handleNumber('7')}>7</button>
        <button onClick={() => handleNumber('8')}>8</button>
        <button onClick={() => handleNumber('9')}>9</button>
        <button onClick={calculateResult}>Result</button>
      </div>
      <p ref={resultRef} className="result">Result:</p>
    </>
  );
}

export default App;