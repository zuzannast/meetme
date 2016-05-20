import React from 'react';
import Event from './event';

export default class EventBox extends React.Component {
  render() {
    return (
      <div>
        <ul className="demo-list-three mdl-list">
          <Event />
          <li className="mdl-list__item mdl-list__item--three-line">
            <span className="mdl-list__item-primary-content">
              <i className="material-icons  mdl-list__item-avatar">person</i>
              <span>Aaron Paul</span>
              <span className="mdl-list__item-text-body">
                Aaron Paul played the role of Jesse in Breaking Bad. He also featured in
                the "Need For Speed" Movie.
              </span>
            </span>
            <span className="mdl-list__item-secondary-content">
              <a className="mdl-list__item-secondary-action" href="#"><i className="material-icons">star</i></a>
            </span>
          </li>
          <li className="mdl-list__item mdl-list__item--three-line">
            <span className="mdl-list__item-primary-content">
              <i className="material-icons  mdl-list__item-avatar">person</i>
              <span>Bob Odenkirk</span>
              <span className="mdl-list__item-text-body">
                Bob Odinkrik played the role of Saul in Breaking Bad. Due to public fondness for the
                character, Bob stars in his own show now, called "Better Call Saul".
              </span>
            </span>
            <span className="mdl-list__item-secondary-content">
              <a className="mdl-list__item-secondary-action" href="#"><i className="material-icons">star</i></a>
            </span>
          </li>
        </ul>
      </div>
    );
  }
}
