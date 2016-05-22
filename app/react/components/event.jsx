import React from 'react';

export default class Event extends React.Component {
  render() {
    return (
      <li className="mdl-list__item mdl-list__item--three-line">
        <span className="mdl-list__item-primary-content">
          <i className="material-icons mdl-list__item-avatar">person</i>
          <span>{ this.props.organiser_name }</span>
          <span className="mdl-list__item-text-body">
            { this.props.description }
          </span>
        </span>
      </li>
    );
  }
}
