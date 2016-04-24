require 'nokogiri'
require 'open-uri'
require 'json'
require_relative 'models/scraper_movie.rb'
require_relative 'models/scraper_theater.rb'

class Scraper
  attr_accessor :city

  def initialize(city)
    @city = city
  end

  def run
    html = Nokogiri::HTML(open("http://www.google.com/movies?mid=&hl=en&near=#{city}"))

    results = []
    html.css('#movie_results .theater').each do |div|
        where = div.css('h2 a').text
        movies = []
        theater = ScraperTheater.new(where, movies).to_h

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
            movie_result = ScraperMovie.new(title, showtimes).to_h
            movies.push(movie_result)
        end
        results.push(theater)
    end


    results.to_json
  end
end
