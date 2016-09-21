import React from 'react';
import { Link } from 'react-router';

export default class Event extends React.Component {
  render() {
    return (
      <Link to={ this.props.event_path }>
      <div className="mdl-card mdl-shadow--2dp theater-people mdl-cell mdl-cell--12-col">
        <div className="mdl-card__media mdl-color-text--grey-50">
          <h3>
            { this.props.showtime.movie.title },<br/>
            <small>{ this.props.showtime.time }, { this.props.showtime.theater.name }</small>
          </h3>
        </div>
        <div className="mdl-color-text--grey-600 mdl-card__supporting-text">
          { this.props.description }
        </div>
        <div className="mdl-card__supporting-text meta mdl-color-text--grey-600">
          <img className="mdl-list__item-avatar" src={ this.props.organiser.gravatar }/>
          <div>
            <strong>{ this.props.organiser.name }</strong>
            <span>{ this.props.formattedDate }</span>
          </div>
        </div>
      </div>
      </Link>
    );
  }
}
