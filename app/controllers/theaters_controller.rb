class TheatersController < ApplicationController
  include ShowtimeHelper

  expose :theater
  expose :theaters, -> { Theater.all }
  expose :cities, -> { Cities.all }
end
