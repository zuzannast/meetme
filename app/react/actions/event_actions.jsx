import API from "../API"

export default {
  getAllEvents() {
    API.getAllEvents();
  },
  sendEvent(description) {
    API.createEvent(description);
  }
}
