import React from 'react';
import { Link } from 'react-router';

export default class Event extends React.Component {
  render() {
    return (
      <Link to={ this.props.event_path }>
        <li className="event__box-flex">
          <div className="demo-card-event mdl-card mdl-shadow--2dp">
            <div className="mdl-card__title mdl-card--expand">
              <h4>
                { this.props.showtime.movie.title },<br/>
                { this.props.showtime.time }
              </h4>
            </div>
            <div className="events__event-box-theater">
              { this.props.showtime.theater.city.name }, { this.props.showtime.theater.name }
            </div>
            <div className="mdl-card__actions mdl-card--border">
              <img className="mdl-list__item-avatar" src={ this.props.organiser.gravatar }/>
              <Link to={ this.props.organiser.path } className="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                { this.props.organiser.name }
              </Link>
              <div className="mdl-layout-spacer"></div>
            </div>
          </div>
        </li>
      </Link>
    );
  }
}
