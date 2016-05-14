import React from 'react';
import EventBox from './event_box';

class Main extends React.Component {
  render() {
    return (
      <div className="container">
      <h1>Hello from the React</h1>
        <EventBox />
      </div>
    );
  }
}

export default Main;
