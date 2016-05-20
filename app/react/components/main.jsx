import React from 'react';
import EventBox from './event_box';
import EventsList from './events_list';

class Main extends React.Component {
  render() {
    return (
      <div className=".mdl-layout__content">
      <h1>Hello from the React</h1>
        <EventBox />
        <EventsList />
      </div>
    );
  }
}

export default Main;
