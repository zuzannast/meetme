import React form 'react';
import ReactDOM from 'react-dom';
import Index from '.components/index';

import { Router, Route, link } from 'react-router';

class App extends React.Component {
  render() {
    return (
      <div>
        {this.props.children}
      </div>
    );
  }
}


let documentReady = () => {
  let reactNode = document.getElementById('react');
  if (reactNode) {
    ReactDOM.render(
      <Router>
        <Route component={App}>
          <Route path="/" component={Index} />
        </Route>
      </Router>
    , reactNode);
  }
};

$(documentReady);
