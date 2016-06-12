class Event < ActiveRecord::Base
  has_many :users, through: :participants
  has_many :participants
  has_one  :showtime
  has_many :comments

  validates :date, :description, :title, :organiser_id, :showtime_id, presence: true

  def as_json(options={})
    super(methods: [:organiser, :event_path, :formatted_date, :showtime])
  end

  def organiser
    organiser = User.find(organiser_id).decorate
    {
      name: organiser.display_name,
      path: "/users/#{organiser.id}",
      gravatar: organiser.gravatar,
    }
  end

  def showtime
    showtime = Showtime.find(showtime_id)
    {
      time: showtime.time,
      theater:
        {
          name: showtime.theater.name,
          path: "/theaters/#{showtime.theater.id}",
          city: showtime.theater.city
        },
      movie:
        {
          title: showtime.movie.title,
          path: "/movies/#{showtime.movie.id}"
        }
    }
  end

  def formatted_date
    self.decorate.formatted_date
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
