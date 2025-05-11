
// Our new Greeting component
const Greeting = props => <p>Hello {props.name}!</p>

function App() {
  return (
    <div>
      <h1>My App</h1>
      <br />
      <Greeting name="Figgy" />
    </div>
  );
}

export default App;
