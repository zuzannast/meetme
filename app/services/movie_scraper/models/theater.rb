module MovieScraper
  module Models
    class Theater
      attr_accessor :name, :movies, :city_name

      def initialize(name, movies, city_name)
        @name = name
        @movies = movies
        @city_name = city_name
        find_or_create_theaters
      end

      def to_h
        hash = {}
        instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
        hash
      end

      private

      def find_or_create_theaters
        city = ::City.find_by(name: city_name)
        ::Theater.find_or_create_by(name: name, city: city) unless name.empty?
      end
    end
  end
end
