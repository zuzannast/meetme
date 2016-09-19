require 'nokogiri'
require 'open-uri'

module MovieScraper
  class SingleRun
    attr_accessor :city_name, :starting_html

    def initialize(city_name, starting_html)
      @city_name = city_name
      @starting_html = starting_html
    end

    def execute
      single_run
    end

    private

    def single_run
      html = Nokogiri::HTML(open(starting_html))
      results = []

      html.css('#movie_results .theater').each_with_object([]) do |div, movies|
        name = get_movie_name(div)
        next if theater_closed?(div)

        theater = MovieScraper::Models::Theater.new(name, city_name).to_h

        div.css('.movie').each do |movie|
          movie_result = get_movie_result(movie, theater)
          movies.push(movie_result)
        end

        results.push(theater)
      end

      display_updated(results) unless results.empty?
    end

    def get_movie_result(movie, theater)
      MovieScraper::Models::Movie.new(
        get_title(movie),
        get_showtimes(movie),
        theater['name'],
        get_info(movie)
      ).to_h
    end

    def get_title(movie)
      movie.css('.name a').text
    end

    def get_showtimes(movie)
      movie.css('.times').text
        .gsub('#8206;', '')
        .gsub('&nbsp;', '')
        .gsub('&nbsp', '')
        .gsub('&', '')
        .gsub('&#39;', "'")
        .split(" ")
    end

    def get_info(movie)
      movie.css('.info').text.split(" - ")
    end

    def get_movie_name(div)
      empty_title?(div) ? headline_title(div) : link_title(div)
    end

    def empty_title?(div)
      div.css('h2 a').text.empty?
    end

    def headline_title(div)
      div.css('h2').text
    end

    def link_title(div)
      div.css('h2 a').text
    end

    def theater_closed?(div)
      div.css('.closure').text == 'Not showing movies'
    end

    def display_updated(results)
      results.each do |result|
        puts "Updated results for #{result['name']} in #{result['city_name']}"
      end
    end
  end
end
