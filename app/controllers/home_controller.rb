class HomeController < ApplicationController
  expose_decorated(:user) { current_user }

  def index
  end
end
