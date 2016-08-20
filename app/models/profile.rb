class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :traits, through: :profiles_traits
  has_many :profiles_traits
  has_many :genres, through: :profiles_genres, as: :favourites
  has_many :profiles_genres
end
