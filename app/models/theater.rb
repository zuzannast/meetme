class Cinema < ActiveRecord::Base
  belongs_to :city
  has_many :showtimes
end
