require_relative '../movies_scraper/scraper'

namespace :scraper do
  desc 'Scrap showtimes'
  task 'scrap_showtimes' => :environment do
    City.all.for_each do |city|
      showtimes = Scraper.run('Krakow')
    end
  end
end
