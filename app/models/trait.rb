class Trait < ActiveRecord::Base
  has_many :profiles, through: :profiles_traits
  has_many :profiles_traits
end
