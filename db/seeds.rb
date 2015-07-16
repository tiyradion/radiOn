# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

boolean = [true, false]

bobby = Station.create!(name: "Bobby Blues", email: "bblues@zstation.com", password: "password", station_name: "Z100", address_1: Faker::Address.street_address,
  zipcode: Faker::Address.zip, city: Faker::Address.city, state: Faker::Address.state_abbr, phone_number: Faker::PhoneNumber.phone_number)
  bobby.picture_upload_url("https://s3.amazonaws.com/radion-college-radio/bobby.jpg")

rob = Station.create!(name: "Rob Rock", email: "rrock@k96.com", password: "password", station_name: "K96 FM", address_1: Faker::Address.street_address,
  zipcode: Faker::Address.zip, city: Faker::Address.city, state: Faker::Address.state_abbr, phone_number: Faker::PhoneNumber.phone_number )
  rob.picture_upload_url("https://s3.amazonaws.com/radion-college-radio/rob.jpg")

susie = Station.create!(name: "Susie Sounds", email: "ssounds@classic88.com", password: "password", station_name: "88.1 Classic", address_1: Faker::Address.street_address,
  zipcode: Faker::Address.zip, city: Faker::Address.city, state: Faker::Address.state_abbr, phone_number: Faker::PhoneNumber.phone_number )
  susie.picture_upload_url("https://s3.amazonaws.com/radion-college-radio/susie.jpg")

jimmy = Station.create!(name: "Jimmy Jams", email: "jjams@94x.com", password: "password", station_name: "94X FM", address_1: Faker::Address.street_address,
  zipcode: Faker::Address.zip, city: Faker::Address.city, state: Faker::Address.state_abbr, phone_number: Faker::PhoneNumber.phone_number )
  jimmy.picture_upload_url("https://s3.amazonaws.com/radion-college-radio/jimmy.jpg")

ida = Station.create!(name: "Ida Indie", email: "iindie@newwave.com", password: "password", station_name: "New Wave FM", address_1: Faker::Address.street_address,
  zipcode: Faker::Address.zip, city: Faker::Address.city, state: Faker::Address.state_abbr, phone_number: Faker::PhoneNumber.phone_number )
  ida.picture_upload_url("https://s3.amazonaws.com/radion-college-radio/ida.jpg")

josh = Promoter.create!(name: "Josh Zie", email: "jzie@compassmusic.com", password: "password", company_name: "Compass Music Marketing",
  phone_number: "919-405-8657", station_ids:[bobby.id, susie.id, ida.id, jimmy.id])
  josh.picture_upload_url("https://s3.amazonaws.com/radion-college-radio/josh.jpg")

  best_coast = Artist.new(name: "Best Coast", album_name: "Only Place", song_name: "Only Place", promoter_id: josh.id)
  best_coast.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Best+Coast+-+The+Only+Place.mp3")
  best_coast.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band1.jpg")
  best_coast.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band11.jpg")
  best_coast.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band9.jpg")
  best_coast.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: best_coast.id , station_id: bobby.id, reviewed: false, responded: false)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: best_coast.id , station_id: susie.id, reviewed: true, responded: false)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: best_coast.id , station_id: ida.id, reviewed: true, responded: true)

kathy = Promoter.create!(name: "Kathy Price", email: "kprice@plantgroup.com", password: "password", company_name: "Planetary Group",
  phone_number: "404-405-8557", station_ids: [rob.id, ida.id, susie.id])
  kathy.picture_upload_url("https://s3.amazonaws.com/radion-college-radio/kathy.jpg")

  blackbird = Artist.new(name: "Blackbird", album_name: "Blackbird", song_name: "Left to Hurt", promoter_id: kathy.id)
  blackbird.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Blackbird+Blackbird+-+Left+To+Hurt.mp3")
  blackbird.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band2.jpg")
  blackbird.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band12.jpg")
  blackbird.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band10.jpg")
  blackbird.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: blackbird.id , station_id: rob.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: blackbird.id , station_id: ida.id, reviewed: boolean.sample)

tim = Promoter.create!(name: "Tim Jones", email: "tjones@independentmusic.com", password: "password", company_name: "Independent Music Promotions",
  phone_number: "803-555-1657", station_ids:[rob.id, susie.id, jimmy.id])
  tim.picture_upload_url("https://s3.amazonaws.com/radion-college-radio/tim.jpg")

  racers = Artist.new(name: "Racers", album_name: "Turning Wheels", song_name: "Through My Eyes", promoter_id: tim.id)
  racers.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Still+Corners+-+Fireflies.mp3")
  racers.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band3.jpg")
  racers.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band1.jpg")
  racers.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band11.jpg")
  racers.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: racers.id , station_id: rob.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: racers.id , station_id: susie.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: racers.id , station_id: jimmy.id, reviewed: boolean.sample)

  booleans = Artist.new(name: "Booleans", album_name: "Ruby", song_name: "Scripture of J", promoter_id: tim.id)
  booleans.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Still+Corners+-+Fireflies.mp3")
  booleans.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band4.jpg")
  booleans.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band2.jpg")
  booleans.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band12.jpg")
  booleans.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: booleans.id , station_id: rob.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: booleans.id , station_id: jimmy.id, reviewed: boolean.sample)

  corners = Artist.new(name: "Still Corners", album_name: "Fireflies", song_name: "Fireflies", promoter_id: tim.id)
  corners.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Still+Corners+-+Fireflies.mp3")
  corners.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band5.jpg")
  corners.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band3.jpg")
  corners.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band1.jpg")
  corners.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: corners.id , station_id: rob.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: corners.id , station_id: susie.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: corners.id , station_id: jimmy.id, reviewed: boolean.sample)

sky = Promoter.create!(name: "Sky Taylor", email: "staylor@urbanmarketing.com", password: "password", company_name: "Urban Marketing",
  phone_number: "366-444-8627", station_ids:[susie.id, jimmy.id, ida.id, bobby.id])
  sky.picture_upload_url("https://s3.amazonaws.com/radion-college-radio/sky.jpg")

  frizzle = Artist.new(name: "Frizzle", album_name: "Fast Times", song_name: "Life Without You", promoter_id: sky.id)
  frizzle.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Future+Islands+-+Tin+Man.mp3")
  frizzle.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band6.jpg")
  frizzle.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band4.jpg")
  frizzle.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band2.jpg")
  frizzle.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: frizzle.id , station_id: susie.id, reviewed: true, responded: true)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: frizzle.id , station_id: jimmy.id, reviewed: boolean.sample)

  lone = Artist.new(name: "Lone Stars", album_name: "Watch", song_name: "Stopping Elvis", promoter_id: sky.id)
  lone.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Future+Islands+-+Tin+Man.mp3")
  lone.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band7.jpg")
  lone.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band5.jpg")
  lone.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band3.jpg")
  lone.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: lone.id , station_id: ida.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: lone.id , station_id: susie.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: lone.id , station_id: jimmy.id, reviewed: boolean.sample)

  islands = Artist.new(name: "Future Islands", album_name: "Islands", song_name: "Tin Man", promoter_id: sky.id)
  islands.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Future+Islands+-+Tin+Man.mp3")
  islands.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band8.jpg")
  islands.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band6.jpg")
  islands.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band4.jpg")
  islands.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: islands.id , station_id: ida.id, reviewed: true, responded: true )
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: islands.id , station_id: susie.id, reviewed: boolean.sample)

thomas = Promoter.create!(name: "Thomas Jackson", email: "tjackson@vitriolpromotion.com", password: "password", company_name: "Vitriol Promotion",
  phone_number: "901-333-8117", station_ids: [bobby.id, rob.id, ida.id, jimmy.id, susie.id])
  thomas.picture_upload_url("https://s3.amazonaws.com/radion-college-radio/thomas.jpg")

  blues = Artist.new(name: "Blues Brothers", album_name: "Bros", song_name: "Life", promoter_id: thomas.id)
  blues.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Yeasayer+-+2080.mp3")
  blues.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band9.jpg")
  blues.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band7.jpg")
  blues.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band5.jpg")
  blues.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: blues.id , station_id: bobby.id, reviewed: true, responded: true)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: blues.id , station_id: rob.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: blues.id , station_id: jimmy.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: blues.id , station_id: ida.id, reviewed: boolean.sample)

  yeasayer = Artist.new(name: "Yeasayer", album_name: "Sayer", song_name: "2080", promoter_id: thomas.id)
  yeasayer.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Yeasayer+-+2080.mp3")
  yeasayer.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band10.jpg")
  yeasayer.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band8.jpg")
  yeasayer.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band6.jpg")
  yeasayer.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: yeasayer.id , station_id: bobby.id, reviewed: true, responded: true)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: yeasayer.id , station_id: rob.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: yeasayer.id , station_id: jimmy.id, reviewed: true, responded: true)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: yeasayer.id , station_id: ida.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: yeasayer.id , station_id: susie.id, reviewed: boolean.sample)
