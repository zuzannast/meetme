MeetMe
======

## About the app
MeetMe is a social network to connect people with the same interest in studio cinemas. 
It allows users to create and join events, meet new people and confirm via the app that the meeting happened. 

## Technology stack 
* Ruby 2.2.2
* Rails 4.2.6
* React ^15.0.1
* Webpack ^0.4.0
* PostgreSQL

## Setup
* Clone the repository
* Install gems via `bundle install`
* Copy example files and edit them if needed
```bash
cp config/secrets.yml.sample config/secrets.yml 
cp config/database.yml.sample config/database.yml
```
* Setup database:
```ruby
rake db:create
rake db:migrate
rake db:seed 
```
* Run the scraper to get the latest movie showtimes
```ruby
rake scraper:scrap_showtimes
```
