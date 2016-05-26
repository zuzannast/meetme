import AppDispatcher from '../dispatcher';
import ActionTypes from '../constants';
import AppEventEmitter from './app_event_emitter';

let _events = [];

class EventEventEmitter extends AppEventEmitter {
  getAll() {
    return _events.map(event => {
      event.formattedDate = moment(event.created_at).fromNow();
      return event;
    });
  }
}

let EventStore = new EventEventEmitter();

AppDispatcher.register( action => {
  switch(action.actionType) {
    case ActionTypes.RECEIVED_EVENTS:
      _events = action.rawEvents;
      EventStore.emitChange();
      break;
    case ActionTypes.RECEIVED_ONE_EVENT:
      _events.unshift(action.rawEvent);
      EventStore.emitChange();
    default:
      // no op
  }
});

export default EventStore;
