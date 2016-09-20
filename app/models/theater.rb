class Theater < ActiveRecord::Base
  belongs_to :city
  has_many :movies, through: :showtimes
  has_many :showtimes, dependent: :destroy

  validates :name, :city_id, presence: true
end
