// Activity 2.01: Create a Blog Post Usin React Handlers
// In this activity, we are going to build out an application that keeps track of the number 
// of characters entered into a text area. This will require us to hook into a new event 
// that we have not used yet and change the text and element rendered to the page to 
// display the total length of the field. Specifically, we are going to make a text area that, 
// unless the user has entered at least 100 characters, will not allow you to submit the 
// form and post the text. 
import './App.css';
import React, { Component } from 'react';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      text: '',
      charCount: 0,
    };
    this.handleTextAreaChange = this.handleTextAreaChange.bind(this);
    this.checkIfOKToSubmit = this.checkIfOKToSubmit.bind(this);
  }

  handleTextAreaChange = (event) => {
    const blogText = event.target.value;  
    this.setState({text: blogText, charCount: blogText.length})
  

  }

  clearBlogText = () => {
    this.setState({text: '', charCount: 0})
  }

  checkIfOKToSubmit = () => {
    if (this.state.charCount <= 100) {
      alert("Submitting blog post...");
    } else {
      alert("Blog must be 100 characters or less. Please edit.");
    }
  }
  charsLeft()  {
    const charCountLeft = 100 - this.state.charCount;
    return(
     <span id="charsLeft">chars left: {charCountLeft}</span>
    );
  }

  render() {
    return (
      <div className="App">
        <header>
          <h1>Blog Post Writer</h1>
          <hr />
        </header>
        <textarea rows="4" cols="50"
          placeholder="Enter your thoughts here..."
          value={this.state.text}
          onChange={this.handleTextAreaChange} >
        </textarea>
        <br/>
        <button onClick={this.clearBlogText}>Clear Text</button>
        <button onClick={this.checkIfOKToSubmit}>Submit</button>
        {this.charsLeft()}
      </div>
    );
  }
}

export default App;
