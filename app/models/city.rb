class City < ActiveRecord::Base
  has_many :theaters, dependent: :destroy

  validates :name, presence: true
end
