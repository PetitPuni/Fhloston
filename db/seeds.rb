require 'faker'
puts 'destroying db'

Planet.destroy_all
User.destroy_all

puts 'creating db'

user1 = User.create!(
  email: 'tata@gmail.com',
  password: 'azerty'
)
user1.username = "explorateur#{user1.id}"
user1.description = "add a short description in your profile"
user1.save

user2 = User.create!(
  email: 'toto@gmail.com',
  password: 'azerty'
)

user2.username = "explorateur#{user2.id}"
user2.description = "add a short description in your profile"
user2.save


  Planet.create!(
    name: Faker::Space.star,
    planet_type: 'Carbon planet',
    summary: Faker::Restaurant.description,
    inhabitants: rand(1..2_000_000_000),
    available_places: rand(1..5),
    location: Faker::Space.galaxy,
    catch_phrase: Faker::Company.catch_phrase,
    price: rand(1..20_000),
    user: user1
  )

  Planet.create!(
    name: Faker::Space.star,
    planet_type: 'Gas dwarf',
    summary: Faker::Restaurant.description,
    inhabitants: rand(1..2_000_000_000),
    available_places: rand(1..5),
    location: Faker::Space.galaxy,
    catch_phrase: Faker::Company.catch_phrase,
    price: rand(1..20_000),
    user: user1
  )

  Planet.create!(
    name: Faker::Space.star,
    planet_type: 'Desert planet',
    summary: Faker::Restaurant.description,
    inhabitants: rand(1..2_000_000_000),
    available_places: rand(1..5),
    location: Faker::Space.galaxy,
    catch_phrase: Faker::Company.catch_phrase,
    price: rand(1..20_000),
    user: user1
  )

  Planet.create!(
    name: Faker::Space.star,
    planet_type: 'Gas giant',
    summary: Faker::Restaurant.description,
    inhabitants: rand(1..2_000_000_000),
    available_places: rand(1..5),
    location: Faker::Space.galaxy,
    catch_phrase: Faker::Company.catch_phrase,
    price: rand(1..20_000),
    user: user1
  )

  Planet.create!(
    name: Faker::Space.star,
    planet_type: 'Helium planet',
    summary: Faker::Restaurant.description,
    inhabitants: rand(1..2_000_000_000),
    available_places: rand(1..5),
    location: Faker::Space.galaxy,
    catch_phrase: Faker::Company.catch_phrase,
    price: rand(1..20_000),
    user: user2
  )

  Planet.create!(
    name: Faker::Space.star,
    planet_type: 'Ice giant',
    summary: Faker::Restaurant.description,
    inhabitants: rand(1..2_000_000_000),
    available_places: rand(1..5),
    location: Faker::Space.galaxy,
    catch_phrase: Faker::Company.catch_phrase,
    price: rand(1..20_000),
    user: user2
  )

  Planet.create!(
    name: Faker::Space.star,
    planet_type: 'Iron planet',
    summary: Faker::Restaurant.description,
    inhabitants: rand(1..2_000_000_000),
    available_places: rand(1..5),
    location: Faker::Space.galaxy,
    catch_phrase: Faker::Company.catch_phrase,
    price: rand(1..20_000),
    user: user2
  )

  Planet.create!(
    name: Faker::Space.star,
    planet_type: 'Lava planet',
    summary: Faker::Restaurant.description,
    inhabitants: rand(1..2_000_000_000),
    available_places: rand(1..5),
    location: Faker::Space.galaxy,
    catch_phrase: Faker::Company.catch_phrase,
    price: rand(1..20_000),
    user: user2
  )


puts 'DB finished'
