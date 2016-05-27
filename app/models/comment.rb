class Comment < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  def as_json(options={})
    super(methods: [:name, :gravatar])
  end

  def name
    user.decorate.display_name
  end

  def gravatar
    user.decorate.gravatar
  end

  def self.stream_for(event_id)
    where(event_id: event_id)
    .all
    .order(created_at: :desc)
  end
end
