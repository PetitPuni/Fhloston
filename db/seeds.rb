require 'faker'

puts 'DB start'

5.times do
  Planet.create!(
    name: Faker::Space.star,
    planet_type: ['Carbon planet', 'Gas dwarf', 'Desert planet', 'Gas giant', 'Helium planet', 'Ice giant', 'Iron planet', 'Lava planet'].sample
  )
end

puts 'DB finished'


# t.string "planet_type"
# t.string "summary"
# t.integer "inhabitants"
# t.integer "available_places"
# t.string "location"
# t.integer "price"
