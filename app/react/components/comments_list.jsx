import React from 'react';
import Comment from './comment';

export default class CommentsList extends React.Component {
  render() {
    let comments = this.props.comments.map(comment => <Comment key={comment.id} {...comment} />);
    return (
      <div className="demo-list-three">
        <ul className="mdl-list">
          { comments }
        </ul>
      </div>
    );
  }
}
