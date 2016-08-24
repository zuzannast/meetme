module ShowtimeHelper
  def showtimes_for_select
    Showtime.all
      .includes(:theater)
      .includes(:movie)
      .collect { |s| ["#{s.theater.name}, #{s.movie.title}, #{s.time}", s.id] }
  end

  def showtimes_grouped_by_movie
    Showtime.where(theater_id: theater.id).group_by(&:movie_id)
  end

  def movie_title(group)
    Movie.find(group.first).title
  end
end
