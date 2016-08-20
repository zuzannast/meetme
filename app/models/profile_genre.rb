class ProfileGenre < ActiveRecord::Base
  belongs_to :profile
  belongs_to :genre
end
