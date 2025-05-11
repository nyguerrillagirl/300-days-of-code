// buystuff e-commerce website
import React, { Component } from 'react'
import './App.css';

const Header = (props) => {
    return <h1>{props.title}</h1>
};


const InventoryItem = (props) => {
    return (
    <>
    <h3>{props.name}</h3>
    <hr />
    <p>{props.price}</p>
    </>
  );
};

class App extends Component {

  constructor(props) {
      super(props);

      this.state = { 
        items: [ 
          { itemName: "Shoe", itemPrice: 5 }, 
          { itemName: "Sock", itemPrice: 3 } 
        ] 
      };
    }

  render() {
    return (
      <div>
        <Header title="Buystuff E-commerce Website" />
        <InventoryItem name={this.state.items[0].itemName} price={this.state.items[0].itemPrice} />
        <InventoryItem name={this.state.items[1].itemName} price={this.state.items[1].itemPrice} />
      </div>
    );
  
  }

}

export default App;
