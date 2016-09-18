class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper

  def redirect_to_app
    if user_signed_in?
      redirect_to_app_or_profile
    else
      redirect_to events_list_path
    end
  end
end
