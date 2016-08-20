class UsersController < ApplicationController
  include CityHelper

  before_action :authenticate_user!
  expose :user, -> { UserDecorator.new(current_user) }
  expose :profile, -> { user.profile }
  expose :users, -> { User.all }
  expose :cities, -> { cities_for_select }

  def edit
    user.build_profile unless profile
  end

  def update
    user.update(user_params)
    redirect_to user_profile_path(user, profile)
  end

  private

  def user_params
    params.require(:user).permit(profile_attributes: [:first_name, :last_name, :city_id])
  end
end
