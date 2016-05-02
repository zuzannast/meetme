module ShowtimeHelper
  def showtimes_for_select
    Showtime.all
      .includes(:theater)
      .includes(:movie)
      .collect { |s| ["#{s.theater.name}, #{s.movie.title}, #{s.time}", s.id] }
  end
end
