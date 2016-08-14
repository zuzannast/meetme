class UsersController < ApplicationController
  include CityHelper

  before_action :authenticate_user!
  expose :user, -> { UserDecorator.new(current_user) }
  expose :cities, -> { cities_for_select }

  def edit
  end

  def update
    user.update(user_params)
    redirect_to user_profile_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :city_id)
  end
end
