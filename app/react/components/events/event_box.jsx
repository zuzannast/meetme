import React from 'react';
import { Link } from 'react-router';

import EventStore from '../../stores/event_store';
import CommentStore from '../../stores/comment_store';
import EventActions from '../../actions/event_actions';
import CommentActions from '../../actions/comment_actions';
import CommentsList from '../comments/comments_list';
import CommentBox from '../comments/comment_box';
import JoinLink from './join_link';

let getAppState = (eventId) => {
  return {
    event: EventStore.getOne(eventId),
    comments: CommentStore.getAll(eventId)
  };
};

export default class EventBox extends React.Component {
  constructor(props) {
    super(props);
    this.state = getAppState(this.props.params.eventId);
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
    let event = this.state.event;

    return (
      <div className="events__event-box">
        <div className="demo-card-wide mdl-card mdl-shadow--2dp">
          <div className="mdl-card__title">
            <h2 className="mdl-card__title-text">
              { event.title}
              <br />
              { event.formatted_date }
            </h2>
          </div>
          <div className="mdl-card__supporting-text">
            <big> { event.showtime.movie.title } </big>
            <div>
              { event.showtime.theater.city.name }, { event.showtime.theater.name }
            </div>
            <i> { event.description } </i>
          </div>
          <div className="mdl-card__actions mdl-card--border">
            <img className="mdl-list__item-avatar" src={ event.organiser.gravatar }/>
            <Link to={ event.organiser.path } className="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
              { event.organiser.name }
            </Link>
            <JoinLink event={ event }/>
          </div>
          <div className="mdl-card__menu">
            <button className="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
              <i className="material-icons">share</i>
            </button>
          </div>
        </div>

        <CommentBox event_id={ event.id } />

        <div className="demo-list-three">
          <CommentsList comments={ this.state.comments } />
        </div>
      </div>
    );
  }
}
