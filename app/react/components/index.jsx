import React from 'react';
import EventBox from './event_box';
import EventsList from './events_list';
import EventStore from "../stores/event_store";

import EventActions from '../actions/event_actions';
EventActions.getAllEvents();

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
      <div className=".mdl-layout__content">
        <EventBox />
        <EventsList events={ this.state.eventsList } />
      </div>
    );
  }
}
