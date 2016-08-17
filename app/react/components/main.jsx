import React from 'react';
import { render } from 'react'
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

import App from './app';
import Index from './index';
import EventBox from './events/event_box';
import EventsList from './events/events_list';
import Event from './events/event';
import Follow from './follow';

let Main =
  <Router history={browserHistory}>
    <Route path="/app" component={App}>
      <IndexRoute component={Index} />
      <Route path="/events" component={EventsList}>
        <Route path="/:id" component={EventBox}/>
      </Route>
      <Route path="/follow" component={Follow} />
    </Route>
  </Router>

export default Main;
