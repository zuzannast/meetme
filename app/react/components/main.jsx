import React from 'react';
import EventBox from './event_box';
import EventsList from './events_list';

class Main extends React.Component {
  constructor(props) {
    super(props);
    this.state = { eventsList: [] };
  }
  addEvent(eventToAdd) {
    let newEventsList = this.state.eventsList;
    newEventsList.unshift({ id: Date.now(), user: 'Guest', description: eventToAdd });

    this.setState({ eventsList: newEventsList });
  }

  render() {
    return (
      <div className=".mdl-layout__content">
        <EventBox sendEvent={ this.addEvent.bind(this) } />
        <EventsList events={ this.state.eventsList } />
      </div>
    );
  }
}

export default Main;
