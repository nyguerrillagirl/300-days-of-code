import React, { Component } from 'react';
import './App.css';

// Includes exercise 2.02: Writing our first event handler
// Includes exercise 2.03: Building our Username valiadator 
// Includes exercise 2.04: Using Alternative Class Declarations to avoid binds
// Includes exercise 2.05: Creating a Validation for Input Fields 
class App extends Component {
  
  state = {
        username: '',
        password: '',
        passwordConfirmation: '',
        email: '',
        errors: []
  };

  validateNotEmtpty(fieldName, value) {
    if (value.length <= 0) {
      return `${fieldName} must be filled out.`;
    }
  }

  submitForm = (event) => {
    event.preventDefault();
    console.log("Submitting the form now...");
    console.log(event);
  }

  validateUsernameOnBlur = (event) => {
    const username = event.target.value;
    const errors = this.state.errors;
    errors.push(this.validateNotEmtpty("Username", username));
    this.setState({username, errors});
  }

  validatePasswordOnBlur = (event) => {
    const password = event.target.value;
    const errors = this.state.errors;
    errors.push(this.validateNotEmtpty("Password", password));
    this.setState({password, errors});
  }
  displayErrors() {
    return (
      <div className="errors">
        {this.state.errors.map((error, index) => {
          return (
            <p key={`err-${index}`} className="alert alert-danger">
              {error}
            </p>
          );
        })}
      </div>
    )
  }

  displayForm() {
    return (
      <form>
          <div className="form-group">
              <label htmlFor="username">Username: </label>
              <input id="username" type="text" onBlur={this.validateUsernameOnBlur}/>
              <label htmlFor="password">Password: </label>
              <input id="password" type="text" onBlur={this.validatePasswordOnBlur}/>
          <label htmlFor="password_confirmation">Password Confirmation:</label>
          <input id="password_confirmation" type="text" />
          <label htmlFor="email">Email: </label>
          <input id="email" type="text" />
          </div>
          <button onClick={this.submitForm}>Submit</button>
      </form>


    );
  }


  render() {
    return (
      <div className="App">
        Create Account
        {this.displayErrors()}
      <hr />
        {this.displayForm()}
      </div>
    );
  };


}

export default App;
