require 'nokogiri'
require 'open-uri'
require 'json'
require_relative 'model/movie.rb'
require_relative 'model/theater.rb'

print "enter city: "
city = STDIN.gets.downcase.chomp

html = Nokogiri::HTML(open("http://www.google.com/movies?mid=&hl=en&near=#{city}"))

results = []
html.css('#movie_results .theater').each do |div|
    where = div.css('h2 a').text
    movies = []
    theater = Theater.new(where, movies).to_h

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
        movie_result = Movie.new(title, showtimes).to_h
        movies.push(movie_result)
    end
    results.push(theater)
end


print results.to_json
