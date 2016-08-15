import ServerActions from "./actions/server_actions"

export default {
  getAllEvents() {
    $.get("/app/events")
    .success( rawEvents => ServerActions.receivedEvents(rawEvents))
    .error(error => console.log(error));
  },
  getOneEvent(eventId) {
    $.get("/app/events", { event_id: eventId })
    .success( rawEvent => ServerActions.receivedOneEvent(rawEvent))
    .error(error => console.log(error));
  },
  createEvent(description) {
    $.post("/app/events", { description })
    .success( rawEvent => ServerActions.receivedOneEvent(rawEvent))
    .error(error => console.log(error));
  },
  joinEvent(eventId) {
    $.post("/app/participants", { event_id: eventId })
    .success( rawParticipant => ServerActions.receivedOneParticipant(rawParticipant))
    .error(error => console.log(error));
  },
  leaveEvent(eventId) {
    $.ajax({
      url: "/app/participants/" + eventId,
      method: 'DELETE'
    }).done(rawParticipant => ServerActions.removedOneParticipant(rawParticipant))
    .fail(error => console.log(error));
  },
  getAllUsers() {
    $.get("/app/followers/random")
    .success( rawUsers => ServerActions.receivedUsers(rawUsers))
    .error(error => console.log(error));
  },
  followUser(userId) {
    $.post("/app/followers", { user_id: userId })
    .success( rawFollower => ServerActions.receivedOneFollower(rawFollower))
    .error(error => console.log(error));
  },
  getAllComments(eventId) {
    $.get("/app/comments", { event_id: eventId })
    .success( rawComments => ServerActions.receivedComments(rawComments))
    .error(error => console.log(error));
  },
  createComment(body, eventId) {
    $.post("/app/comments", { body, eventId })
    .success( rawComment => ServerActions.receivedOneComment(rawComment))
    .error(error => console.log(error));
  },
}
