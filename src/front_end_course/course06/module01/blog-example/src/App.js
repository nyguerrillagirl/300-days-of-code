import './App.css';
import { UserProvider, useUser } from './UserContext';

const LoggedInUser = () => {
  const { user } = useUser();
  return (
    <p>
      Hello <span className="Username">{user.name}</span>
    </p>  
  );
};

const Header = () => {
  return(
    <header>
      <h2>Blog App</h2>
      <LoggedInUser />
    </header>
  );
};

const Page = () => {
  const {user} = useUser();

  return (
    <div className="articleSection">
      <h2>What is Lorem ipsum?</h2>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
        Nullam auctor, nisl at tincidunt ultricies, elit purus
        fermentum justo, non viverra urna nisl sit amet nunc. 
        In hac habitasse platea dictumst. 
        Donec sed eros non odio elementum lacinia.
        Nullam auctor, nisl at tincidunt ultricies, elit purus
        fermentum justo, non viverra urna nisl sit amet nunc.

      </p>
      <p>Written by {user.name} </p>
    </div>
  );
}

function App() {
  return (
    <div className="App">

        <Header />
        <Page />

    </div>
  );
}

function Root() {
  return (
    <UserProvider>
         <App />   
    </UserProvider>
  );
}

export default Root;
