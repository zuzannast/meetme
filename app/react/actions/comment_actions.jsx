import API from "../API"

export default {
  getAllComments() {
    API.getAllComments();
  },
  sendComment(body) {
    API.createComment(body);
  }
}
