import React from 'react';
import { Link } from 'react-router';
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

  followUser(userId) {
    UserActions.followUser(userId);
  }

  followClasses(following) {
    return "mdl-list__item-secondary-content " + (following ? "pink-text" : "grey-text");
  }

  render() {
    let users = this.state.users.map( user => {
      return(
        <li key={user.id} className="mdl-list__item mdl-list__item--two-line">
          <span className="mdl-list__item-primary-content">
            <img className="mdl-list__item-avatar" src={ user.gravatar }/>
            <span>{ user.name }</span>
          </span>
          <a className={this.followClasses(user.following)} onClick={this.followUser.bind(this, user.id)}>
            <i className="material-icons">person_pin</i>
          </a>
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
