import React from 'react';
import { render } from 'react'
import { Router, Route, Link, browserHistory } from 'react-router';

import App from './app';
import Index from './index';
import EventBox from './event_box';
import Event from './event';
import Follow from './follow';

let Main =
  <Router history={browserHistory}>
    <Route component={App}>
      <Route path="/" component={Index} />
      <Route path="/events/:eventId" component={EventBox} />
      <Route path="/follow" component={Follow} />
    </Route>
  </Router>

export default Main;

var element = document.getElementById('react');
renderRouter('Main', element);
