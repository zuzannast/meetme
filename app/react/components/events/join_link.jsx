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
    return 'align-right mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect ' + (joined ? "blue-text" : "pink-text");
  }

  joinText(joined) {
    return joined ? 'You joined' : 'Count me in!';
  }

  participantsAmount(joined){
    let participants = this.props.event.participants.length;
    return joined ? (participants + 1) : participants;
  }

  clickOption(joined) {
    return joined ? this.leaveEvent.bind(this, this.props.event.id) : this.joinEvent.bind(this, this.props.event.id)
  }

  render() {
    let joined = this.props.event.joined;
    return (
      <div className="join-link">
        <a className={this.joinClasses(joined)} onClick={this.clickOption(joined)}>
          {this.joinText(joined)}
        </a>
        <small className="align-right mdl-button grey-text"> {this.participantsAmount(joined)} participants </small>
      </div>
    );
  }
}
