import React from 'react';
import Event from './event';

export default class EventBox extends React.Component {
  render() {
    return (
      <div>
        <ul className="demo-list-three mdl-list">
          <Event />
          <Event />
          <Event />
        </ul>
      </div>
    );
  }
}
