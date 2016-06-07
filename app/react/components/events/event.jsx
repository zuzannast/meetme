import React from 'react';
import { Link } from 'react-router';

export default class Event extends React.Component {
  render() {
    return (
      <Link to={ this.props.event_path }>
        <li className="mdl-list__item mdl-list__item--three-line">
          <span className="mdl-list__item-primary-content">
            <img className="mdl-list__item-avatar" src={ this.props.organiser.gravatar }/>
            <span>{ this.props.organiser.name }</span>
            <span className="mdl-list__item-text-body">
              { this.props.description }
            </span>
          </span>
          <span className="mdl-list__item-secondary-content">
            <span className="mdl-list__item-secondary-info">{this.props.formattedDate}</span>
          </span>
        </li>
      </Link>
    );
  }
}
