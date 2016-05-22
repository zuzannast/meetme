import React from 'react';

export default class Event extends React.Component {
  render() {
    return (
      <li className="mdl-list__item mdl-list__item--three-line">
        <span className="mdl-list__item-primary-content">
          <img className="mdl-list__item-avatar" src={ this.props.gravatar }/>
          <span>{ this.props.organiser_name }</span>
          <span className="mdl-list__item-text-body">
            { this.props.description }
          </span>
        </span>
        <span className="mdl-list__item-secondary-content">
          <span className="mdl-list__item-secondary-info">{this.props.formattedDate}</span>
        </span>
      </li>
    );
  }
}
