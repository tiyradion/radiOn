# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  Station.create(name: Faker::Name.name, email: Faker::Internet.email, password_digest: "password")
end

20.times do
  Comment.create(description: Faker::Company.catch_phrase, artist_id: rand(1..10), station_id: rand(1..5))
end

5.times do
  Promoter.create(name: Faker::Company.name, email: Faker::Internet.email, password_digest: "password")
end

10.times do
  Artist.create(name: Faker::App.name, promoter_id: rand(1..5))
end
