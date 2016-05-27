class Event < ActiveRecord::Base
  has_many :users, through: :events_users
  has_many :events_users
  has_one  :showtime
  has_many :comments

  def as_json(options={})
    super(methods: [:organiser_name, :gravatar, :event_path, :formatted_date])
  end

  def organiser
    User.find(organiser_id).decorate
  end

  def formatted_date
    self.decorate.formatted_date
  end

  def organiser_name
    organiser.display_name
  end

  def gravatar
    organiser.gravatar
  end

  def event_path
    "/events/#{id}"
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
