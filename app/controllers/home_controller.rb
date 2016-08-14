class HomeController < ApplicationController
  expose :user, -> { UserDecorator.new(current_user) }

  def index
  end
end
