class Movie < ActiveRecord::Base
  has_and_belongs_to_many :genres
  has_many :theaters, through: :showtimes
  has_many :showtimes, dependent: :destroy

  validates :title, presence: true
end
