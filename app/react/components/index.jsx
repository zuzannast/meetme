import React from 'react';
import { Link } from 'react-router';
import EventsList from './events_list';
import EventStore from "../stores/event_store";

import EventActions from '../actions/event_actions';

let getAppState = () => {
  return { eventsList: EventStore.getAll() };
};

export default class Index extends React.Component {
  constructor(props) {
    super(props);
    this.state = getAppState();
    this._onChange = this._onChange.bind(this);
  }

  componentDidMount() {
    EventActions.getAllEvents();
    EventStore.addChangeListener(this._onChange);
  }

  componentWillUnMount() {
    EventStore.removeChangeListener(this._onChange);
  }

  _onChange() {
    this.setState(getAppState());
  }

  render() {
    return (
      <div>
        <div className="demo-list-three">
          <Link to="/follow" className="follow-link">Who to follow?</Link>
        </div>
        <EventsList events={ this.state.eventsList } />
      </div>
    );
  }
}
