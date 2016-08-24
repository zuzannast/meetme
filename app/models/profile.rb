class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  has_many :traits, through: :profile_traits
  has_many :profile_traits
  has_many :genres, through: :profile_genres
  has_many :profile_genres

  accepts_nested_attributes_for :profile_genres
end
