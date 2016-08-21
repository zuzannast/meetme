class Genre < ActiveRecord::Base
  has_and_belongs_to_many :movies
  has_many :profiles, through: :profiles_genres
  has_many :profiles_genres

  accepts_nested_attributes_for :profiles_genres

  validates :name, presence: true
end
