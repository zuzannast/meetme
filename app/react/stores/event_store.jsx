import AppDispatcher from "../dispatcher";
import ActionTypes from "../constants";
import { EventEmitter } from "events";

let _events = [];
const CHANGE_EVENT = "CHANGE";

class EventEventEmitter extends EventEmitter {
  getAll() {
    return _events.map(event => {
      event.formattedDate = moment(event.created_at).fromNow();
      return event;
    });
  }

  emitChange(){
    this.emit(CHANGE_EVENT);
  }
  addChangeListener(callback){
    this.on(CHANGE_EVENT, callback);
  }
  removeChangeListener(callback){
    this.removeLister(CHANGE_EVENT, callback);
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
