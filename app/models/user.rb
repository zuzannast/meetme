class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :events, through: :events_users
 belongs_to :city

 def as_json(options={})
   { id: id, name: self.decorate.display_name, gravatar: self.decorate.gravatar }
 end
end
