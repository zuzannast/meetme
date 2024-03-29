import AppDispatcher from '../dispatcher';
import ActionTypes from '../constants';
import AppEventEmitter from './app_event_emitter';

let _comments = [];

class CommentEventEmitter extends AppEventEmitter {
  getAll(eventId) {
    return _comments.map(comment => {
      comment.formattedDate = moment(comment.created_at).fromNow();
      return comment;
    });
  }
}

let CommentStore = new CommentEventEmitter();

AppDispatcher.register( action => {
  switch(action.actionType) {
    case ActionTypes.RECEIVED_COMMENTS:
      _comments = action.rawComments;
      CommentStore.emitChange();
      break;
    case ActionTypes.RECEIVED_ONE_COMMENT:
      _comments.unshift(action.rawComment);
      CommentStore.emitChange();
      break;
    default:
      // no op
  }
});

export default CommentStore;
