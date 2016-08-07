import React from 'react';
import EventActions from '../../actions/event_actions'

export default class JoinLink extends React.Component {
  joinEvent(eventId) {
    EventActions.joinEvent(eventId);
  }

  leaveEvent(eventId) {
    EventActions.leaveEvent(eventId);
  }

  joinClasses(joined) {
    return 'align-right mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect ' + (joined ? "pink" : "grey");
  }

  joinText(joined) {
    return joined ? 'Joined' : 'Count me in!';
  }

  clickOption(joined) {
    return joined ? this.leaveEvent.bind(this, this.props.event.id) : this.joinEvent.bind(this, this.props.event.id)
  }

  render() {
    let joined = this.props.event.joined;
    return (
      <a className={this.joinClasses(joined)} onClick={this.clickOption(joined)}>
        {this.joinText(joined)}
      </a>
    );
  }
}
