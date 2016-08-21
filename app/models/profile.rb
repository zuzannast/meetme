class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  has_many :traits, through: :profile_traits
  has_many :profile_traits
  has_many :genres, through: :profiles_genres
  has_many :profiles_genres

  accepts_nested_attributes_for :profiles_genres
end
