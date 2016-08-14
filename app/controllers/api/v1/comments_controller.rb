module Api
  module V1
    class CommentsController < Base
      def index
        render json: Comment.stream_for(params[:event_id])
      end

      def new
        @comment = Comment.new
      end

      def create
        comment = Comment.create(body: params[:body],
                                 event_id: params[:eventId],
                                 user_id: current_user.id
                                 )
        render json: comment
      end
    end
  end
end
