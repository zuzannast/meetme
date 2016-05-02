class UsersController < ApplicationController
  before_action :authenticate_user!
  expose(:user) { current_user }

  def show
  end
end
