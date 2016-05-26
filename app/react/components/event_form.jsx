import React from 'react';
import EventActions from '../actions/event_actions';

export default class EventForm extends React.Component {
  sendEvent(event) {
    event.preventDefault();
    EventActions.sendEvent(this.refs.eventTextArea.value);
    this.refs.eventTextArea.value = '';
  }
  render() {
    return (
      <div className="demo-list-three">
        <form onSubmit={this.sendEvent.bind(this)}>
          <div className="mdl-textfield mdl-js-textfield">
            <textarea ref="eventTextArea" className="mdl-textfield__input" />
            <label className="mdl-textfield__label">What's going on?</label>
          </div>
          <button type="submit" className="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
            <i className="material-icons">add</i>
          </button>
        </form>
      </div>
    );
  }
}
