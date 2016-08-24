class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # expose :user, -> { UserDecorator.new(current_user) }

  def redirect_to_app
    redirect_to app_path
  end
end
