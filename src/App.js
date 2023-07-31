import logo from "./logo.svg";
import "./App.css";
import TagManager from "react-gtm-module";

function App() {
  const config = {
    gtmId: "GTM-MHXXQ3CC",
  };

  TagManager.initialize(config);

  const pushDataLayer = () => {
    // console.log("Hey ...")
    window.dataLayer.push({ event: "customEvent", data: { name: "test", region: "India" } });
  };

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <button
          className="GASample-button"
          id="GA-7568"
          onClick={() => pushDataLayer()}
          href="https://google.com"
        >
          Click me
        </button>
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
