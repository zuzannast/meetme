import ServerActions from "./actions/server_actions"

export default {
  getAllEvents() {
    $.get("/events")
    .success( rawEvents => ServerActions.receivedEvents(rawEvents))
    .error(error => console.log(error));
  }
}
