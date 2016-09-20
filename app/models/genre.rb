class Genre < ActiveRecord::Base
  has_and_belongs_to_many :movies
  has_many :profiles, through: :profile_genres
  has_many :profile_genres, dependent: :destroy

  accepts_nested_attributes_for :profile_genres

  validates :name, presence: true
end
