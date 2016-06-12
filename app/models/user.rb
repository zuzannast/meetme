class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :events, through: :participants
 has_many :participants
 belongs_to :city
 has_many :comments

 def as_json(options={})
   { id: id, name: self.decorate.display_name, gravatar: self.decorate.gravatar }
 end

 def self.who_to_follow(current_user_id)
   where(["id != :current_user_id and not exists (
       select 1 from followers
       where user_id = users.id
       and followed_by = :current_user_id
     )", { current_user_id: current_user_id }])
    .order("random()").all
 end
end
