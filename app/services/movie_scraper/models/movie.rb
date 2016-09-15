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
            description: info_hash[:time],
            origin: info_hash[:origin]
          )
        end
      end

      def info_hash
        {
          time: info_time,
          genres: info_genres,
          origin: info_origin
        }
      end

      def add_genres
        return if info_hash[:genres].empty?

        info_hash[:genres].each do |genre_name|
          movie.genres << ::Genre.find_or_create_by(name: genre_name)
        end
      end

      def add_showtimes
        showtimes.each do |showtime|
          ::Showtime.find_or_create_by(
            time: showtime,
            movie: movie,
            theater: theater
          )
        end
      end

      def info_time
        info[0][/^[1-9]hr.*/] || ''
      end

      def info_genres
        info[1].nil? ? '' : info[1].split("/")
      end

      def info_origin
        info[2].nil? ? '' : info[2]
      end
    end
  end
end
