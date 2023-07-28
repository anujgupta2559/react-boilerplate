import logo from './logo.svg';
import './App.css';

function App() {

  function pushToLayer(e){
    const dataLayer = window.dataLayer
    dataLayer.push({
      e
    })
  }
  return (

<div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <button className='GASample-button' id="GA-7568" href="https://google.com" onClick={(e)=>pushToLayer(e)}>Click me</button>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React @
        </a>
      </header>
    </div>
  );
}

export default App;
