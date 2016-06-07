import React from 'react';
import { Link } from 'react-router';

import EventStore from '../../stores/event_store';
import CommentStore from '../../stores/comment_store';
import EventActions from '../../actions/event_actions';
import CommentActions from '../../actions/comment_actions';
import CommentsList from '../comments/comments_list';
import CommentBox from '../comments/comment_box'

let getAppState = (eventId) => {
  return {
    event: EventStore.getOne(eventId),
    comments: CommentStore.getAll(eventId)
  };
};

export default class EventBox extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
                    event: EventStore.getOne(this.props.params.eventId),
                    comments: CommentStore.getAll(this.props.params.eventId)
                  }
    this._onChange = this._onChange.bind(this);
  }

  componentDidMount() {
    EventActions.getOneEvent(this.props.params.eventId);
    CommentActions.getAllComments(this.props.params.eventId);
    EventStore.addChangeListener(this._onChange);
    CommentStore.addChangeListener(this._onChange);
  }

  componentWillUnMount() {
    EventStore.removeChangeListener(this._onChange);
    CommentStore.removeChangeListener(this._onChange);
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
            <big> { this.state.event.showtime.movie.title } </big>
            <div>
              { this.state.event.showtime.theater.city.name }, { this.state.event.showtime.theater.name }
            </div>
            <i> { this.state.event.description } </i>
          </div>
          <div className="mdl-card__actions mdl-card--border">
            <Link to={ this.state.event.organiser.path } className="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
              { this.state.event.organiser.name }
            </Link>
            <Link to={ this.state.event.organiser.path } className="align-right mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
              Count me in!
            </Link>
          </div>
          <div className="mdl-card__menu">
            <button className="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
              <i className="material-icons">share</i>
            </button>
          </div>
        </div>

        <CommentBox event_id={ this.state.event.id } />

        <div className="demo-list-three">
          <CommentsList comments={ this.state.comments } />
        </div>
      </div>
    );
  }
}
