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
  },
  receivedOneParticipant(rawParticipant) {
    AppDispatcher.dispatch({
      actionType: ActionTypes.RECEIVED_ONE_PARTICIPANT,
      rawParticipant
    })
  },
  removedOneParticipant(rawParticipant) {
    AppDispatcher.dispatch({
      actionType: ActionTypes.REMOVED_ONE_PARTICIPANT,
      rawParticipant
    })
  },
  receivedUsers(rawUsers) {
    AppDispatcher.dispatch({
      actionType: ActionTypes.RECEIVED_USERS,
      rawUsers
    })
  },
  receivedOneFollower(rawFollower) {
    AppDispatcher.dispatch({
      actionType: ActionTypes.RECEIVED_ONE_FOLLOWER,
      rawFollower
    })
  },
  receivedComments(rawComments) {
    AppDispatcher.dispatch({
      actionType: ActionTypes.RECEIVED_COMMENTS,
      rawComments
    })
  },
  receivedOneComment(rawComment) {
    AppDispatcher.dispatch({
      actionType: ActionTypes.RECEIVED_ONE_COMMENT,
      rawComment
    })
  },
}
