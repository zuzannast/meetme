class Showtime < ActiveRecord::Base
  belongs_to :theater
  belongs_to :movie
  belongs_to :event

  validates :time, :movie_id, presence: true
end
