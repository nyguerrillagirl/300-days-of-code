import React, { Component } from 'react';
import './App.css';

// Includes exercise 2.02: Writing our first event handler
// Includes exercise 2.03: Building our Username valiadator 
// Includes exercise 2.04: Using Alternative Class Declarations to avoid binds
// Includes exercise 2.05: Creating a Validation for Input Fields 

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      password: '',
      passwordConfirmation: '',
      email: '',
      errors: []
    };
    this.validateUsernameOnBlur = this.validateUsernameOnBlur.bind(this);
    this.validatePasswordOnBlur = this.validatePasswordOnBlur.bind(this);
    this.validateEmailOnBlur = this.validateEmailOnBlur.bind(this);
    this.validatePasswordConfirmationOnBlur = this.validatePasswordConfirmationOnBlur.bind(this);
}

  clearError(errorMessage) {
      let errors = this.state.errors;
      if (errors.includes(errorMessage)) {
        errors.splice(errors.indexOf(errorMessage), 1);
      }
      this.setState({...this.state,errors: errors});
  }

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
    this.clearError("Username must be filled out.");
    const errors = this.state.errors;
    errors.push(this.validateNotEmtpty("Username", username));
    this.setState({username, errors});
  }

  validatePasswordOnBlur = (event) => {
    const password = event.target.value;
    this.clearError("Password must be filled out.");
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

  validateEmailFormat(fieldName, value) {
    // First clear this error
    let [lhs, rhs] = value.split('@');
    lhs = lhs || '';
    rhs = rhs || '';
    if (lhs.length <= 0 || rhs.length <= 0) {
      return `${fieldName} must be a valid email address.`;
    }
  }

  validateEmailOnBlur(event) {
    const email = event.target.value;
    this.clearError("Email must be a valid email address.")
    const errors = this.state.errors;
    errors.push(this.validateEmailFormat("Email", email));
    this.setState({email, errors});
  }

  validatePasswordConfirmationOnBlur(event) {
    const passwordConfirmation = event.target.value;
    const errors = this.state.errors;
    if (passwordConfirmation !== this.state.password) {
      errors.push("Password Confirmation must match Password.");
    }
    this.setState({passwordConfirmation, errors});
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
          <input id="password_confirmation" type="text" onBlur={this.validatePasswordConfirmationOnBlur}/>
          <label htmlFor="email">Email: </label>
          <input id="email" type="text" onBlur={this.validateEmailOnBlur}/>
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
