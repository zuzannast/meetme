import React from 'react';

export default class EventBox extends React.Component {
  render() {
    return (
      <div>
        <form>
          <textarea />
          <label>What goin' on?</label>
          <button>Publish</button>
        </form>
      </div>
    );
  }
}
