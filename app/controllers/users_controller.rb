class UsersController < ApplicationController
  include CityHelper

  before_action :authenticate_user!
  expose(:user) { current_user }
  expose(:cities) { cities_for_select }

  def show
  end
end
