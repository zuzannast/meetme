class Event < ActiveRecord::Base
  has_many :users, through: :events_users
  has_many :events_users
  has_one :showtime

  def as_json(options={})
    super(methods: [:organiser_name, :gravatar])
  end

  def organiser
    User.find(organiser_id).decorate
  end

  def organiser_name
    organiser.display_name
  end

  def gravatar
    organiser.gravatar
  end

  def self.stream_for(current_user_id)
    joins(:users)
    .where(["organiser_id = :current_user_id or users.id in (
      select user_id from followers where followed_by = :current_user_id
      )", { current_user_id: current_user_id }])
    .order(created_at: :desc)
    .all
  end
end
