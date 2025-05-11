import React, { Component } from 'react';

// We want to keep track of the number of times a particular button is clicked.
// We want to display the count to the user.

// Our new Greeting component
const Greeting = props => <p>Hello {props.name}!</p>
// The above code defines a functional component called Greeting that takes props as an argument and returns a paragraph element with a greeting message.
// Functional components are simpler and easier to read than class-based components.
// They are often used for presentational components that do not require state or lifecycle methods.
// Functional components are a great way to create reusable UI elements in React.


class App extends Component {
  constructor(props) {
    super(props);
    this.title = "React App";
    this.state = { clickCounter: 0 };
  }

  renderClickCount() {
    return <p>I've been clicked {this.state.clickCounter} times!</p>
  }

  render() {
    return (
      <div className="App">
        <h1>{this.title}</h1>
        <br />
       <Greeting name="User" />
       {this.renderClickCount()}
      </div>
    );
  }
}
// The above code is a simple React component that renders a heading and a message.
// It uses the class-based component syntax, which is one of the ways to define components in React.
// Class-based components are often used when you need to manage state or lifecycle methods.
// However, with the introduction of React Hooks, functional components have become more popular.
// Functional components are simpler and easier to read, especially for components that do not require state or lifecycle methods.

export default App;
