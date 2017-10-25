import React, { Component } from 'react';
import './App.css';

class App extends Component {
  constructor(props) {
    super(props);

    this.toggle = this.toggle.bind(this);
    this.state = {
      isOpen: false
    };
  }
  toggle() {
    this.setState({
      isOpen: !this.state.isOpen
    });
  }
  render() {
    return (
      <div>
        <nav className="navbar navbar-light bg-light">
          <a className="navbar-brand" href="https://www.squarescale.com">
            <img src="logo.svg" height="30" alt="SquareScale" />
          </a>
        </nav>
        <div className="container">
          <div className="row my-4">
            <div className="col text-center">
              <img src="img.png" />
            </div>
          </div>
          <div className="row my-4">
            <div className="col text-center">
              <h1 className="display-1">Welcome to SquareScale</h1>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
