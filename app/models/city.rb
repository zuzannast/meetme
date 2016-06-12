class City < ActiveRecord::Base
  has_many :theaters

  validates :name, presence: true
end
