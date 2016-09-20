class Showtime < ActiveRecord::Base
  belongs_to :theater
  belongs_to :movie
  has_many :events, dependent: :destroy

  validates :time, :movie_id, presence: true
end
