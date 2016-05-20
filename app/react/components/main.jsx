import React from 'react';
import EventBox from './event_box';
import EventsList from './events_list';

let mockEvents = [
  { user: 'Zuzia', description: 'My first event' },
  { user: 'Zuzia', description: 'My second event' },
  { user: 'Zuzia', description: 'My third event' },
]

class Main extends React.Component {
  render() {
    return (
      <div className=".mdl-layout__content">
      <h1>Hello from the React</h1>
        <EventBox />
        <EventsList events={mockEvents} />
      </div>
    );
  }
}

export default Main;
