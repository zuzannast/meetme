import React from 'react';
import CommentActions from '../../actions/comment_actions';

export default class CommentBox extends React.Component {
  sendComment(comment) {
    comment.preventDefault();
    CommentActions.sendComment(this.refs.commentTextArea.value, this.props.event_id);
    this.refs.commentTextArea.value = '';
  }
  render() {
    return (
      <div className="demo-list-three">
        <form onSubmit={this.sendComment.bind(this)}>
          <div className="mdl-textfield mdl-js-textfield">
            <textarea ref="commentTextArea" className="mdl-textfield__input" />
            <label className="mdl-textfield__label">Want to post a comment?</label>
          </div>
          <button type="submit" className="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
            <i className="material-icons">add</i>
          </button>
        </form>
      </div>
    );
  }
}
