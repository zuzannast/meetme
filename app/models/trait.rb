class Trait < ActiveRecord::Base
  has_many :profiles, through: :profile_traits
  has_many :profile_traits, dependent: :destroy
end
