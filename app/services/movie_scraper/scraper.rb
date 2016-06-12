require 'nokogiri'
require 'open-uri'
require 'json'

module MovieScraper
  class Scraper
    attr_accessor :city_name

    def initialize(city_name)
      @city_name = city_name
    end

    def run
      html = Nokogiri::HTML(open("http://www.google.com/movies?mid=&hl=en&near=#{I18n.transliterate(city_name)}"))

      results = []
      html.css('#movie_results .theater').each do |div|
          name = div.css('h2 a').text.empty? ? div.css('h2').text : div.css('h2 a').text
          next if div.css('.closure').text == 'Not showing movies'

          movies = []
          theater = MovieScraper::Models::Theater.new(name, city_name).to_h

          div.css('.movie').each do |movie|
              title = movie.css('.name a').text
              showtimes = []
              times = movie.css('.times').text
                .gsub('#8206;', '')
                .gsub('&nbsp;', '')
                .gsub('&nbsp', '')
                .gsub('&', '')
                .gsub('&#39;', "'")
              showtimes = times.split(" ")
              info = movie.css('.info').text.split(" - ")

              movie_result = MovieScraper::Models::Movie.new(title, showtimes, theater['name'], info).to_h
              movies.push(movie_result)
          end
          results.push(theater)
      end

      puts results.to_json
    end
  end
end
