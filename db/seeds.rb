# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

music = ["https://s3.amazonaws.com/radion-college-radio/Best+Coast+-+The+Only+Place.mp3",
  "https://s3.amazonaws.com/radion-college-radio/Blackbird+Blackbird+-+Left+To+Hurt.mp3",
  "https://s3.amazonaws.com/radion-college-radio/Still+Corners+-+Fireflies.mp3",
  "https://s3.amazonaws.com/radion-college-radio/Future+Islands+-+Tin+Man.mp3",
  "https://s3.amazonaws.com/radion-college-radio/Yeasayer+-+2080.mp3"]

boolean = [true, false]

5.times do
  Promoter.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "password",
    company_name: Faker::Company.name, phone_number: Faker::PhoneNumber.phone_number)
end

5.times do
  station = Station.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "password",
    station_name: Faker::Team.name, address_1: Faker::Address.street_address, zipcode: Faker::Address.zip,
    city: Faker::Address.city, state: Faker::Address.state_abbr, phone_number: Faker::PhoneNumber.phone_number )
  station.update(promoter_ids: [rand(1..3), rand(4..5)])
end

20.times do
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample, artist_id: rand(1..10), station_id: rand(1..5))
end

10.times do
  artist = Artist.new(name: Faker::App.author, album_name: Faker::App.name, song_name: Faker::Team.name, promoter_id: rand(1..5))
  artist.uploaded_file_url(music.sample)
  artist.save
end
