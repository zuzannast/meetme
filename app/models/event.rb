class Event < ActiveRecord::Base
  has_many :users, through: :events_users
  has_one :showtime

  def organiser_name
    User.find(organiser_id).decorate.display_name
  end

  def as_json(options={})
    super(methods: [:organiser_name])
  end
end
