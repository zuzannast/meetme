import React from 'react';
import EventBox from './event_box';
import EventsList from './events_list';

class Main extends React.Component {
  constructor(props) {
    super(props);
    this.state = { eventsList: [] };
  }

  formattedEvents(eventsList) {
    let formattedEvents = eventsList.map(event => {
      event.formattedDate = moment(event.created_at).fromNow();
      return event;
    });
    return {
      eventsList: eventsList
    };
  }

  addEvent(eventToAdd) {
    $.post("/events", { description: eventToAdd })
    .success( savedEvent => {
      let newEventsList = this.state.eventsList;
      newEventsList.unshift(savedEvent);
      this.setState(this.formattedEvents(newEventsList));
    })
    .error(error => console.log(error))
  }

  componentDidMount() {
    $.ajax("/events")
    .success(data => this.setState(this.formattedEvents(data)))
    .error(error => console.log(error))
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
