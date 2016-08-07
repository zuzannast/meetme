import ServerActions from "./actions/server_actions"

export default {
  getAllEvents() {
    $.get("/events")
    .success( rawEvents => ServerActions.receivedEvents(rawEvents))
    .error(error => console.log(error));
  },
  getOneEvent(eventId) {
    $.get("/events", { event_id: eventId })
    .success( rawEvent => ServerActions.receivedOneEvent(rawEvent))
    .error(error => console.log(error));
  },
  createEvent(description) {
    $.post("/events", { description })
    .success( rawEvent => ServerActions.receivedOneEvent(rawEvent))
    .error(error => console.log(error));
  },
  joinEvent(eventId) {
    $.post("/participants", { event_id: eventId })
    .success( rawParticipant => ServerActions.receivedOneParticipant(rawParticipant))
    .error(error => console.log(error));
  },
  getAllUsers() {
    $.get("/followers/random")
    .success( rawUsers => ServerActions.receivedUsers(rawUsers))
    .error(error => console.log(error));
  },
  followUser(userId) {
    $.post("/followers", { user_id: userId })
    .success( rawFollower => ServerActions.receivedOneFollower(rawFollower))
    .error(error => console.log(error));
  },
  getAllComments(eventId) {
    $.get("/comments", { event_id: eventId })
    .success( rawComments => ServerActions.receivedComments(rawComments))
    .error(error => console.log(error));
  },
  createComment(body, eventId) {
    $.post("/comments", { body, eventId })
    .success( rawComment => ServerActions.receivedOneComment(rawComment))
    .error(error => console.log(error));
  },
}
