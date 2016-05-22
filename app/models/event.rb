class Event < ActiveRecord::Base
  has_many :users, through: :events_users
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
    hash = Digest::MD5.hexdigest(organiser.email)
    "http://www.gravatar.com/avatar/#{hash}"
  end
end
