class Theater < ActiveRecord::Base
  belongs_to :city
  has_many :movies, through: :showtimes

  validates :name, :city_id, presence: true
end
