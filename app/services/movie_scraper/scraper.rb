require 'nokogiri'
require 'open-uri'

module MovieScraper
  class Scraper
    attr_accessor :city_name

    def initialize(city_name)
      @city_name = city_name
    end

    def run
      if next_page?(starting_html)
        multiple_run(starting_html)
      else
        single_run(city_name, starting_html)
      end
    end

    private

    def multiple_run(html)
      SingleRun.new(city_name, html).execute

      number_of_pages(html).times do |i|
        next if i == 0

        html = html.concat(",&start=#{i}0")
        SingleRun.new(city_name, html).execute
        i += 1
      end
    end

    def single_run(city, html)
      SingleRun.new(city, html).execute
    end

    def next_page?(html)
      nokogiri_open_html(html).css(".n table .b a").text == 'Next'
    end

    def starting_html
      "http://www.google.com/movies?mid=&hl=en&near=#{I18n.transliterate(city_name)}"
    end

    def number_of_pages(html)
      nokogiri_open_html(html).css(".n table td").text.delete("Next").last.to_i
    end

    def nokogiri_open_html(html)
      Nokogiri::HTML(open(html))
    end
  end
end
