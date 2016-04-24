module MovieScraper
  module Models
    class Movie
      attr_accessor :title, :theater_name, :showtimes, :info, :movie

      def initialize(title, showtimes, theater_name, info)
        @title = title
        @showtimes = showtimes
        @theater_name = theater_name
        @info = info
        find_or_create_movie
        add_genres
        add_showtimes
      end

      def to_h
        hash = {}
        instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
        hash
      end

      private

      def theater
        ::Theater.find_by(name: theater_name)
      end

      def find_or_create_movie
        if title.present?
          @movie = ::Movie.find_or_create_by(
            title: title,
            description: info_hash["time"],
            origin: info_hash["origin"]
          )
        end
      end

      def info_hash
        {
          time: info[0],
          genres: info[1].split("/"),
          origin: info[2]
        }
      end

      def add_genres
        info_hash["genres"].each do |genre_name|
          movie.genres << ::Genre.find_or_create_by(genre_name)
        end
      end

      def add_showtimes
        showtimes.each do |showtime|
          ::Showtime.find_or_create_by(
            showtime,
            movie: movie,
            theater: theater
          )
        end
      end
    end
  end
end
