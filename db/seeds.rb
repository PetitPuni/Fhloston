require 'faker'
puts 'destroying db'

Planet.destroy_all
User.destroy_all

puts 'creating db'

user1 = User.create!(
  email: 'tata@gmail.com',
  password: 'azerty'
)

user2 = User.create!(
  email: 'toto@gmail.com',
  password: 'azerty'
)

50.times do
  Planet.create!(
    name: Faker::Space.star,
    planet_type: ['Carbon planet', 'Gas dwarf', 'Desert planet', 'Gas giant', 'Helium planet', 'Ice giant', 'Iron planet', 'Lava planet'].sample,
    summary: Faker::Restaurant.description,
    inhabitants: rand(1..2_000_000_000),
    available_places: rand(1..5),
    location: Faker::Space.galaxy,
    catch_phrase: Faker::Company.catch_phrase,
    price: rand(1..20_000),
    user: [user1, user2].sample
  )
end

puts 'DB finished'
