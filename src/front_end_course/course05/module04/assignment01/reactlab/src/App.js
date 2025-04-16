import {
  useState,
  useRef
} from "react"; 
import "./App.css";

function App() { 
  // Refs to the input and result elements
  const inputRef = useRef(null); // hooked to input element
  const resultRef = useRef(null); // hooked to p element
 
  // Holds the current result of a calculation
  const [result, setResult] = useState(0); 
  const [currentCalculation, setCurrentCalculation] = useState("0");
  
  function plus(e) { 
    doOp(e, "+");
  }; 
 
  function plus(e) { 
    doOp(e, "+");
  }; 
 
  function minus(e) { 
  	doOp(e, "-");
  };
 
  function times(e) { 
    doOp(e, "*");
  }; 
 
  function divide(e) { 
    doOp(e, "/");
  };
 
  function resetInput(e) { 
    e.preventDefault();
   // Clear the input field
   inputRef.current.value = "";
   inputRef.current.focus();
 }; 
 
  function resetInput(e) { 
    e.preventDefault();
   // Clear the input field
   inputRef.current.value = "";
   inputRef.current.focus();
 }; 

 
  function resetResult(e) { 
  	// Clear the result field
    setResult(0);
  }; 

  function doOp(e, operator) {
    console.log("doOp", operator);
    e.preventDefault(); // disable the default behavior of the form

    // recalculate the currentCalculation
    let currentCalculation = result + " " + operator + " " + inputRef.current.value; 

    // set the value in order to be displayed
    setCurrentCalculation(currentCalculation); // update currentCalculation
    
    let currentNumber = Number(inputRef.current.value); // value entered 
    let currentResult = result; // keep track of currentResult 
    let newResult = 0;
    switch (operator) {
      case "+":
        newResult = currentResult + currentNumber;
        break;
      case "-":
        newResult = currentResult - currentNumber;
        break;
      case "*":
        newResult = currentResult * currentNumber;
        break;
      case "/":
        newResult = currentResult / currentNumber;
        break;
      default:
        newResult = currentNumber;
    }
    setResult(newResult);
    resetInput(e);
  }
 
  return ( 
    <div className="App"> 
      <div> 
        <h1>Simplest Working Calculator</h1> 
      </div> 
      <form> 
        <p>
          Current calculation: {currentCalculation}
        </p>
        <p ref={resultRef}> 
          Result: {result} 
        </p> 
        <input
          pattern="[0-9]" 
          ref={inputRef} 
          type="number" 
          placeholder="Type a number" 
        /> 
        <button onClick={plus}>add</button> 
        <button onClick={minus}>subtract</button> 
        <button onClick={times}>multiply</button> 
        <button onClick={divide}>divide</button> 
        <button onClick={resetInput}>reset input</button> 
        <button onClick={resetResult}>reset result</button> 
      </form> 
    </div> 
  ); 
} 
 
export default App; 
