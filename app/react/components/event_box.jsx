import React from 'react';
import EventStore from '../stores/event_store';
import EventActions from '../actions/event_actions';

let getAppState = (eventId) => {
  return { event: EventStore.getOne(eventId) };
};

export default class EventBox extends React.Component {
  constructor(props) {
    super(props);
    this.state = { event: EventStore.getOne(this.props.params.eventId) }
    this._onChange = this._onChange.bind(this);
  }

  componentDidMount() {
    EventActions.getOneEvent(this.props.params.eventId);
  }

  componentWillUnMount() {
    EventStore.removeChangeListener(this._onChange);
    EventStore.addChangeListener(this._onChange);
  }

  _onChange() {
    this.setState(getAppState(this.props.params.eventId));
  }

  render() {
    return (
      <div className="events__event-box">
        <div className="demo-card-wide mdl-card mdl-shadow--2dp">
          <div className="mdl-card__title">
            <h2 className="mdl-card__title-text">
              { this.state.event.title}
              <br />
              { this.state.event.formatted_date }
            </h2>
          </div>
          <div className="mdl-card__supporting-text">
            { this.state.event.description }
          </div>
          <div className="mdl-card__actions mdl-card--border">
            <a className="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
              { this.state.event.organiser_name }
            </a>
          </div>
          <div className="mdl-card__menu">
            <button className="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
              <i className="material-icons">share</i>
            </button>
          </div>
        </div>
      </div>
    );
  }
}
