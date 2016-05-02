class City < ActiveRecord::Base
  has_many :theaters
  belongs_to :user
end
