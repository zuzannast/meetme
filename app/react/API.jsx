import ServerActions from "./actions/server_actions"

export default {
  getAllEvents() {
    $.get("/api/v1/events")
    .success( rawEvents => ServerActions.receivedEvents(rawEvents))
    .error(error => console.log(error));
  },
  getOneEvent(eventId) {
    $.get("/api/v1/events", { event_id: eventId })
    .success( rawEvent => ServerActions.receivedOneEvent(rawEvent))
    .error(error => console.log(error));
  },
  createEvent(description) {
    $.post("/events", { description })
    .success( rawEvent => ServerActions.receivedOneEvent(rawEvent))
    .error(error => console.log(error));
  },
  joinEvent(eventId) {
    $.post("/api/v1/participants", { event_id: eventId })
    .success( rawParticipant => ServerActions.receivedOneParticipant(rawParticipant))
    .error(error => console.log(error));
  },
  leaveEvent(eventId) {
    $.ajax({
      url: "/api/v1/participants/" + eventId,
      method: 'DELETE'
    }).done(rawParticipant => ServerActions.removedOneParticipant(rawParticipant))
    .fail(error => console.log(error));
  },
  getAllUsers() {
    $.get("/api/v1/followers/random")
    .success( rawUsers => ServerActions.receivedUsers(rawUsers))
    .error(error => console.log(error));
  },
  followUser(userId) {
    $.post("/api/v1/followers", { user_id: userId })
    .success( rawFollower => ServerActions.receivedOneFollower(rawFollower))
    .error(error => console.log(error));
  },
  getAllComments(eventId) {
    $.get("/api/v1/comments", { event_id: eventId })
    .success( rawComments => ServerActions.receivedComments(rawComments))
    .error(error => console.log(error));
  },
  createComment(body, eventId) {
    $.post("/api/v1/comments", { body, eventId })
    .success( rawComment => ServerActions.receivedOneComment(rawComment))
    .error(error => console.log(error));
  },
}
