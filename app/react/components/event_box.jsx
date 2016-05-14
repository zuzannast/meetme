import React from 'react';

export default class EventBox extends React.Component {
  render() {
    return (
      <div>
        <form>
          <div className="mdl-textfield mdl-js-textfield">
            <textarea className="mdl-textfield__input" />
            <label className="mdl-textfield__label">What's going on?</label>
          </div>
          <button className="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
            <i className="material-icons">add</i>
          </button>
        </form>
      </div>
    );
  }
}
