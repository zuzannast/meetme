namespace :scraper do
  desc 'Scrap showtimes'
  task 'scrap_showtimes' => :environment do
    City.all.each do |city|
      showtimes = MovieScraper::Scraper.new(city.name).run
    end
  end
end
