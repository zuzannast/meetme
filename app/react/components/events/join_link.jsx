import React from 'react';
import EventActions from '../../actions/event_actions'

export default class JoinLink extends React.Component {
  joinEvent(eventId) {
    EventActions.joinEvent(eventId);
  }

  joinClasses(joined) {
    return 'align-right mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect ' + (joined ? "pink" : "grey");
  }

  joinText(joined) {
    return joined ? 'Joined' : 'Count me in!';
  }

  render() {
    return (
      <a className={this.joinClasses(this.props.event.joined)} onClick={this.joinEvent.bind(this, this.props.event.id)}>
        {this.joinText(this.props.event.joined)}
      </a>
    );
  }
}
