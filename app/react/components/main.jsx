import React from 'react';
import { render } from 'react-dom'
import { Router, Route, Link, browserHistory } from 'react-router';

import App from './app';
import Index from './index';
import Follow from './follow';

export default class Main extends React.Component {
  render() {
    return(
      <Router history={browserHistory}>
        <Route component={App}>
          <Route path="/" component={Index} />
          <Route path="/follow" component={Follow} />
        </Route>
      </Router>
    )
  }
}
