class UsersController < ApplicationController
  include CityHelper

  before_action :authenticate_user!
  expose :user, -> { UserDecorator.new(current_user) }
  expose :profile, -> { user.profile }
  expose :users, -> { User.all }
  expose :cities, -> { cities_for_select }
  expose :genres, -> { get_genres }

  def edit
    user.build_profile unless profile
  end

  def update
    user.update(user_params)
    redirect_to user_profile_path(user, profile)
  end

  private

  def user_params
    params.require(:user).permit(profile_attributes: [:first_name, :last_name, :city_id, genre_ids: []])
  end

  def get_genres
    Genre.all.collect do |g|
      [ g.name, g.id ]
    end
  end
end
