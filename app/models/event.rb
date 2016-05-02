class Event < ActiveRecord::Base
  has_many :users, through: :events_users
  has_one :showtime
end
