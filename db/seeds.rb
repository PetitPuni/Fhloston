require 'faker'

5.times do
  Planet.create(
    name: Faker::Space.planet
  )
end
