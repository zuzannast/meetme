import React from 'react';
import Event from './event';

export default class EventBox extends React.Component {
  render() {
    let events = this.props.events.map(event => <Event key={event.id} {...event} />);
    return (
      <div>
        <ul className="demo-list-three mdl-list">
          { events }
        </ul>
      </div>
    );
  }
}
