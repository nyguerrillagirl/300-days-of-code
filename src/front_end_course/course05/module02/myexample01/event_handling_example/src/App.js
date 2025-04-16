
import './App.css';
import Btn from './Btn.js';




function App() {
  return (
    <div className="App">
      <Btn btnText="Button 1 message" onClick={() => console.log('DEI is about diversity, equity, and inclusion. It is important to have a diverse and inclusive environment.')} />
      <Btn btnText="Button 2 message" onClick={() => console.log('The civil war was about slavery. Do not let anyone tell you otherwise.')} />
    </div>
  );
}

export default App;
