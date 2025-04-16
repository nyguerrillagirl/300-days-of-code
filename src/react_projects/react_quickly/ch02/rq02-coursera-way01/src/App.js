
import './App.css';


function Link(props) {
  return (
    <p>
      <a href={props.url}>{props.framework}</a>
    </p>
  );
}
function App() {
  return (
    <div className="App">
      <Link framework="React" url="//react.dev"/>
      <Link framework="Vue" url="//vuejs.org"/>
      <Link framework="Angular" url="//angular.io"/>
    </div>
  );
}

export default App;
