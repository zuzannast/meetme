import API from "../API"

export default {
  getAllEvents() {
    API.getAllEvents();
  },
  getOneEvent(eventId) {
    API.getOneEvent(eventId);
  },
  sendEvent(description) {
    API.createEvent(description);
  }
}
