class UsersController < ApplicationController
  include CityHelper

  before_action :authenticate_user!
  expose :user
  expose :decorated_user, -> { UserDecorator.new(user) }
  expose :profile, -> { user.profile }
  expose :users, -> { User.all }
  expose :cities, -> { cities_for_select }
  expose :genres, -> { get_genres }
  expose :traits, -> { get_traits }
  expose :user_events, -> { current_user.events }

  def edit
    user.build_profile unless profile
  end

  def update
    if user.update(user_params)
      create_profile_traits
      redirect_to user_profile_path(user, profile)
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      profile_attributes: [:id, :first_name, :last_name, :city_id, { genre_ids: [] }]
    )
  end

  def get_genres
    Genre.pluck(:name, :id)
  end

  def get_traits
    Trait.all
  end

  def create_profile_traits
    Users::CreateProfileTraits.new(profile, params).call
  end
end
