# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cities = City.create([{ name: 'Kraków' }, { name: 'Warszawa' }])

theaters = Theater.create([
  { name: 'ARS Krakowskie Centrum Kinowe-Aneks', city: City.first },
  { name: 'Kino Agrafka', city: City.first }
])
