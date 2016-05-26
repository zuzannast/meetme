import React from 'react';
import {  Link } from 'react-router';
import UserStore from '../stores/user_store';
import UserActions from '../actions/user_actions'

let getAppState = () => {
  return { users: UserStore.getAll() };
};


export default class Follow extends React.Component {
  constructor(props) {
    super(props);
    this.state = getAppState();
    this._onChange = this._onChange.bind(this);
  }

  componentDidMount() {
    UserActions.getAllUsers();
    UserStore.addChangeListener(this._onChange);
  }

  componentWillUnMount() {
    UserStore.removeChangeListener(this._onChange);
  }

  _onChange() {
    this.setState(getAppState());
  }

  render() {
    let users = this.state.users.map( user => {
      return(
        <li key={user.id} className="mdl-list__item mdl-list__item--two-line">
          <span className="mdl-list__item-primary-content">
            <img className="mdl-list__item-avatar" src={ user.gravatar }/>
            <span>{ user.name }</span>
          </span>
        </li>
      )
    });

    return (
      <div className="demo-list-three">
        <h3>Who to follow</h3>
        <ul className="mdl-list">
          { users }
        </ul>
        <Link to="/">Back</Link>
      </div>
    );
  }
}
