import AppDispatcher from "../dispatcher"
import ActionTypes from "../constants"

export default {
  receivedEvents(rawEvents) {
    AppDispatcher.dispatch({
      actionType: ActionTypes.RECEIVED_EVENTS,
      rawEvents
    })
  },
  receivedOneEvent(rawEvent) {
    AppDispatcher.dispatch({
      actionType: ActionTypes.RECEIVED_ONE_EVENT,
      rawEvent
    })
  }
}
