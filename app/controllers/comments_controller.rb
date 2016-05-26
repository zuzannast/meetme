class CommentsController < ApplicationController
  
  def index
    render json: Comment.all.order(created_at: :desc)
  end

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.create(description: params[:description], user_id: current_user.id)
    render json: comment
  end
end
