import API from "../API"

export default {
  getAllComments(eventId) {
    API.getAllComments(eventId);
  },
  sendComment(body, eventId) {
    API.createComment(body, eventId);
  }
}
