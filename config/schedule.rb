# Use this file to easily define all of your cron jobs.

every 1.day, at: '6:00 am' do
  rake "scraper:scrap_showtimes"
end
