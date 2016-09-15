import React from 'react';
import Event from './event';

export default class EventsList extends React.Component {
  render() {
    let events = this.props.events.map(event => <Event key={event.id} {...event} />);
    return (
      <div className="demo-blog__posts mdl-grid">
        { events }
      </div>
    );
  }
}
