### Admin and Users
Admin.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
)

User.create!([
  {
    email: 'samer.buna@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    first_name: 'Samer',
    last_name: 'Buma'
  },
  {
    email: 'aaron.patterson@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    first_name: 'Aaron',
    last_name: 'Patterson'
  }
])

### Cities and theaters
cities = City.create([{ name: 'Kraków' }, { name: 'Warszawa' }])
theaters = Theater.create([
  { name: 'ARS Krakowskie Centrum Kinowe-Aneks', city: City.first },
  { name: 'Kino Agrafka', city: City.first },
  { name: 'Kino Atlantic', city: City.last },
  { name: 'Paradiso', city: City.last }
])

### Movies and showtimes
movies = Movie.create([
  { title: 'Irrational Men', description: '1hr 35min', origin: 'USA' },
  { title: 'Fire at Sea', description: '1hr 48min', origin: 'Italian' }
])

showtimes = Showtime.create([
  { time: '20:00', theater: Theater.first, movie: Movie.first },
  { time: '19:00', theater: Theater.last, movie: Movie.last },
  { time: '18:00', theater: Theater.first, movie: Movie.first },
  { time: '17:00', theater: Theater.last, movie: Movie.last },
  { time: '17:00', theater: Theater.first, movie: Movie.last },
])

### Events
events = Event.create([
  {
    title: 'Meet me at the Woody Allen movie premiere',
    description:
      "Hi, I want to see the latest Woody Allen movie.
      I'm a hude fan of his work and hope to meet up with people who will be willing to discuss
      the outcome afterwards. Hope to see you there!
      ",
    date: '2016-06-03 00:00:00',
    showtime_id: Showtime.first,
    organiser_id: User.first
  },

  {
    title: 'Fire at Sea, MeetMe at Paradiso',
    description: "Just wanted to invite you for some exciting stuff.",
    date: '2016-06-03 00:00:00',
    showtime_id: Showtime.last,
    organiser_id: User.last
  },
])
