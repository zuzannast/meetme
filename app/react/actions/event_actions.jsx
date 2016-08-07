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
  },
  joinEvent(eventId) {
    API.joinEvent(eventId);
  },
  leaveEvent(eventId) {
    API.leaveEvent(eventId);
  }
}
