import React from 'react';
import Event from './event';

export default class EventsList extends React.Component {
  render() {
    let events = this.props.events.map(event => <Event key={event.id} {...event} />);
    return (
      <div className="events__events-list">
        <ul className="events-list events__container-flex">
          { events }
        </ul>
      </div>
    );
  }
}
