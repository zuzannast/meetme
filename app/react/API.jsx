import ServerActions from "./actions/server_actions"

export default {
  getAllEvents() {
    $.get("/events")
    .success( rawEvents => ServerActions.receivedEvents(rawEvents))
    .error(error => console.log(error));
  },
  createEvent(description) {
    $.post("/events", { description })
    .success( rawEvent => ServerActions.receivedOneEvent(rawEvent))
    .error(error => console.log(error));
  },
  getAllUsers() {
    $.get("/followers/random")
    .success( rawUsers => ServerActions.receivedUsers(rawUsers))
    .error(error => console.log(error));
  }
}
