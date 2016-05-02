class UsersController < ApplicationController
  include CityHelper

  before_action :authenticate_user!
  expose(:user) { current_user }
  expose(:cities) { cities_for_select }

  def show
  end

  def edit
  end

  def update
    user = User.find(current_user.id)

    if user.save
      redirect_to user_profile_path(user)
    else
      render :edit
    end
  end
end
