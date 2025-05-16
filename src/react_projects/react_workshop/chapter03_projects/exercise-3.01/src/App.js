// Exercise 3.01: Building Our First App Using Conditional Rendering
// In this exercise, we are going to build a React application that has a button that 
// shows and hides the content on the page on click, very similar to the preceding 
// example. We will create a page with a button and some content in a div, but we will 
// use conditional rendering to show and hide the content.
import React, { Component } from 'react';
import './App.css';

class App extends Component {

  constructor(props) {
    super(props);
    this.state = {
      showSecret: false
    };
    
  }

  secretMessage() {
    return(
      <div className="secret-message">
        I am the secret message!
      </div>
    )
  }

  toggleSecretMessage() {
    this.setState( {
      showSecret: !this.state.showSecret
    });
  }

  render() {
    return (
      <div>
        <button onClick={this.toggleSecretMessage.bind(this)}>
          Click to show the secret message!
        </button>
        { this.state.showSecret ? this.secretMessage() : null }
      </div>
    );
  }
}

export default App;
