class HomeController < ApplicationController
  expose :user, -> { UserDecorator.new(current_user) }
  expose :events, -> { Event.all }

  def index
  end
end
