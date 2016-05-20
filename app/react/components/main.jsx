import React from 'react';
import EventBox from './event_box';
import EventsList from './events_list';

let mockEvents = [
  { id: 1, user: 'Zuzia', description: 'My first event' },
  { id: 2, user: 'Zuzia', description: 'My second event' },
  { id: 3, user: 'Zuzia', description: 'My third event' },
]

class Main extends React.Component {
  constructor(props) {
    super(props);
    this.state = { eventsList: mockEvents };
  }
  addEvent(eventToAdd) {
    let newEventsList = this.state.eventsList;
    newEventsList.unshift({ id: Date.now, user: 'Guest', description: eventToAdd });

    this.setState({ eventsList: newEventsList });
  }

  render() {
    return (
      <div className=".mdl-layout__content">
      <h1>Hello from the React</h1>
        <EventBox sendEvent={ this.addEvent.bind(this) } />
        <EventsList events={ this.state.eventsList } />
      </div>
    );
  }
}

export default Main;
