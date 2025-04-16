import { useState } from 'react';
import Header from './components/Header';
import Nav from './components/Nav';
import ListArea from './components/ListArea';
import Footer from './components/Footer';


function App() {
  const [items, setItems] = useState([]);

  function handleAddItems(item) {
    setItems((items) => [...items, item]);
  }
  
  return (
    <div className="App">
      <Header />
      <Nav handleAddItems={handleAddItems} />
      <ListArea items={items}/>
      <Footer items={items}/>
    </div>
  );
}

export default App;
