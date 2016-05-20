import React from 'react';

export default class EventBox extends React.Component {
  sendEvent(event) {
    event.preventDefault();
    this.props.sendEvent(this.refs.eventTextArea.value);
    this.refs.eventTextArea.value = '';
  }
  render() {
    return (
      <div>
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
