class AdminsController < ApplicationController
  before_action :authenticate_admin!
  expose(:admin) { current_admin }

  def index
  end
end
