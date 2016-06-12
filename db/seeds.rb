### Admin and Users

Admin.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Admin',
  last_name: 'Example'
)

User.create!(
  email: 'samer.buna@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Samer',
  last_name: 'Buma'
)

User.create!(
  email: 'aaron.patterson@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Aaron',
  last_name: 'Patterson'
)

cities = City.create([{ name: 'Kraków' }, { name: 'Warszawa' }])

theaters = Theater.create([
  { name: 'ARS Krakowskie Centrum Kinowe-Aneks', city: City.first },
  { name: 'Kino Agrafka', city: City.first },
  { name: 'Kino Atlantic', city: City.last },
  { name: 'Paradiso', city: City.last }
])
