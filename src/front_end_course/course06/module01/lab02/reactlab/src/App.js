import "./App.css";
import { useState } from "react";
import { validateEmail } from "./utils";

const PasswordErrorMessage = () => {
  return (
    <p className="FieldError">Password should have at least 8 characters</p>
  );
};

function App() {
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState({
    value: "",
    isTouched: false,
  });
  const [isPasswordVisible, setIsPasswordVisible] = useState(false);

  const [role, setRole] = useState("role");

  const toggleVisibility = () => {
    setIsPasswordVisible(!isPasswordVisible);
  };


  const getIsFormValid = () => {
    if (firstName === "" || email === "" || password.value === "" || role === "role") {
      console.log("getIsFormValid - field is empty", firstName, email, password.value, role);
      return false;
    }
    if (password.isTouched && password.value.length < 8) {
      console.log("getIsFormValid - password is less than 8 characters", password.value);
      return false;
    }
    if (!validateEmail(email)) {
      console.log("getIsFormValid - email is not valid", email);
      return false;
    }

    return true;
  };

  const clearForm = () => {
    setFirstName("");
    setLastName("");
    setEmail("");
    setPassword({
      value: "",
      isTouched: false,
    });
    setRole("role");
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    alert("Account created!");
    clearForm();
  };

  const handlePasswordChange = (e) => {
    console.log(e.target.value);
    setPassword({
      value: e.target.value,
      isTouched: true,
    });
  };

  return (
    <div className="App">
      <form onSubmit={handleSubmit}>
        <fieldset>
          <h2>Sign Up</h2>
          <div className="Field">
            <label>
              First name <sup>*</sup>
            </label>
            <input  value={firstName} onChange={e => setFirstName(e.target.value)} placeholder="First name" />
          </div>
          <div className="Field">
            <label>Last name</label>
            <input  value={lastName} onChange={e => setLastName(e.target.value)} placeholder="Last name" />
          </div>
          <div className="Field">
            <label>
              Email address <sup>*</sup>
            </label>
            <input  value={email} onChange={e => setEmail(e.target.value)} placeholder="Email address" />
          </div>
          <div className="Field">
            <label>
              Password <sup>*</sup>
            </label>
            <input  type={isPasswordVisible ? "text" : "password"} value={password.value} onChange={handlePasswordChange} placeholder="Password" />
            <span
              onClick={toggleVisibility}
              style={{
                cursor: "pointer",
                fontSize: "18px",
                color: isPasswordVisible ? "green" : "gray",
              }}>
            {isPasswordVisible ? "👁️" : "🙈"}
          </span>
          {password.isTouched && password.value.length < 8 && <PasswordErrorMessage />}
          </div>
          <div className="Field">
            <label>
              Role <sup>*</sup>
            </label>
            <select value={role} onChange={e => setRole(e.target.value)}>
              <option value="role">Role</option>
              <option value="individual">Individual</option>
              <option value="business">Business</option>
            </select>
          </div>
          <button type="submit" disabled={!getIsFormValid()}>
            Create account
          </button>
        </fieldset>
      </form>
    </div>
  );
}

export default App;
