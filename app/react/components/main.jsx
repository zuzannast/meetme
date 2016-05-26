import React from 'react';
import { Router, Route, Link, browserHistory } from 'react-router';

import App from './app';
import Index from './index';
import Follow from './follow';

let Main =
  <Router history={browserHistory}>
    <Route component={App}>
      <Route path="/" component={Index} />
      <Route path="/follow" component={Follow} />
    </Route>
  </Router>

export default Main;
