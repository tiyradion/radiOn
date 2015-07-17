# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

boolean = [true, false]

bio = ["LMFAO is an electro-hip hop band artists formed in Los Angeles: They consists of a DJ and a rapper, that Redfoo (Stefan Gordy, September 3, 1975)
  and Sky Blue (Skyler Gordy, August 23, 1986), respectively the son and the nephew of the producer Berry Gordy. In the jargon of the Internet and online
  LMFAO stands for 'Laughing My Fucking Ass Off' (laughing out loud with my fucking ass out). The name derives from a conversation between the Internet and
  Sky Blue Redfoo Their first single, entitled 'I'm in Miami Bitch' (censored version 'I'm in Miami Trick') has reached the position No. 51 on Billboard Hot
  100. On July 1, 2008, published LMFAO Party Rock EP on the iTunes music store. Their full-length album Party Rock was published July 7, 2009 and contains
  15 tracks. Their second single, 'La La La', debuted at No. 62 on Billboard Hot 100. Their third single, 'Shots' has now reached the position 24 on the
  Billboard Hot 100. LMFAO I have worked in many other songs including the remix of Love Lockdown by Kanye West and Love Game by Lady Gaga, Gettin 'Over You
  David Guetta and Outta Your Mind by Lil Jon. In 2010 he made ​​from open-act at concerts in America, the Black Eyed Peas. At the parade the Stanley Cup (hockey)
  in Chicago in 2010, Kris Versteeg sang a new version of their song Yes. In 2011, they released Party Rock Anthem tube which then becomes a worldwide hit, and
  the clip is broadcast around the world. LMFAO last ranking of albums and singles sold in the month of July on the American market, according to Billboard for
  the week of reference to be July 30 2011. The Billboard Hot 100 Chart is the almost the same with 'Party Rock Anthem' LMFAO Ft. Lauren of Bennett & Goon Rock
  remains at the top for the second consecutive week.", "Jessica Ellen Cornish, known by her stage name is Jessie J was born in London, March 27, 1988, Jessie
  J is a British singer and songwriter. Jessie J earned fame by writing songs for music artists like Justin Timberlake, Alicia Keys, Miley Cyrus and Christina
  Aguilera and especially thanks to the victory of the critics' prize in the BBC's Sound of 2011 poll. Her first single, Do It Like a Dude, was published in
  November 2010 and reached the second position of the UK charts. Before the publication of her debut album, Who You Are, which took place February 25, has also
  been published in collaboration with BoB Price Tag in January of that year. At the age of eleven attended the West End theater performance of Andrew Lloyd Webber's
  Whistle Down the Wind entitled. Jessie continued her studies at the Mayfield High School in London and attended from the age of 16 years, the BRIT School, where she
  joined a girl group. Jessie J had initially signed a recording contract with record label Gut Records, for whom her released an album, but that went bankrupt before
  the end of the work. Jessie J has since found success as a songwriter, much to receiving a contract by Sony ATV. It is co-author of the single from Miley Cyrus' Party
  in the USA, and the author of songs by artists such as Justin Timberlake, Chris Brown (with whom he was on tour in Europe), Christina Aguilera and Alicia Keys. Jessie
  J has published Do It Like a Dude, it's first single, November 21, 2010. The single entered at number 25 in the UK charts and reached the second. The December 15, 2010
  it was announced that the singer had won the critics prize at the Brit Awards 2011. On December, 6 of that year the BBC has also announced that Jessie J would be part
  of the Sounds of 2011 poll. On January 7, 2011 her victory was announced. Jessie J debut album, Who You Are, was published February 25, 2011 in most of Europe and April
  12 in the United States. A new track called Price Tag, early November 9th live from Jessie J, was published January 28, 2011 as the second single from the album and contains
  some sung by American rapper BoB The song entered the charts in the first position in the United Kingdom, where her remained for two consecutive weeks. Had originally written
  Jessie J, Do It Like a Dude for Rihanna, but decided to keep it for himself. The same fate is destined to LOVE, originally intended to be recorded by Alicia Keys, which is
  part of the track list of the debut album from Jessie J. On April 15, 2011 is also released their third single for Who You Are, Nobody's Perfect, one of the favorite songs
  from the singer."]

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

  best_coast = Artist.new(name: "Best Coast", album_name: "Only Place", song_name: "Only Place", promoter_id: josh.id, bio: bio.sample)
  best_coast.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Best+Coast+-+The+Only+Place.mp3")
  best_coast.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band1.jpg")
  best_coast.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band11.jpg")
  best_coast.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band9.jpg")
  best_coast.uploaded_picture_4_url("https://s3.amazonaws.com/radion-college-radio/band12.jpg")
  best_coast.uploaded_picture_5_url("https://s3.amazonaws.com/radion-college-radio/band6.jpg")
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

  blackbird = Artist.new(name: "Blackbird", album_name: "Blackbird", song_name: "Left to Hurt", promoter_id: kathy.id, bio: bio.sample)
  blackbird.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Blackbird+Blackbird+-+Left+To+Hurt.mp3")
  blackbird.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band2.jpg")
  blackbird.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band12.jpg")
  blackbird.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band10.jpg")
  blackbird.uploaded_picture_4_url("https://s3.amazonaws.com/radion-college-radio/band3.jpg")
  blackbird.uploaded_picture_5_url("https://s3.amazonaws.com/radion-college-radio/band7.jpg")
  blackbird.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: blackbird.id , station_id: rob.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: blackbird.id , station_id: ida.id, reviewed: boolean.sample)

tim = Promoter.create!(name: "Tim Jones", email: "tjones@independentmusic.com", password: "password", company_name: "Independent Music Promotions",
  phone_number: "803-555-1657", station_ids:[rob.id, susie.id, jimmy.id])
  tim.picture_upload_url("https://s3.amazonaws.com/radion-college-radio/tim.jpg")

  racers = Artist.new(name: "Racers", album_name: "Turning Wheels", song_name: "Through My Eyes", promoter_id: tim.id, bio: bio.sample)
  racers.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Still+Corners+-+Fireflies.mp3")
  racers.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band3.jpg")
  racers.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band1.jpg")
  racers.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band11.jpg")
  racers.uploaded_picture_4_url("https://s3.amazonaws.com/radion-college-radio/band4.jpg")
  racers.uploaded_picture_5_url("https://s3.amazonaws.com/radion-college-radio/band9.jpg")
  racers.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: racers.id , station_id: rob.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: racers.id , station_id: susie.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: racers.id , station_id: jimmy.id, reviewed: boolean.sample)

  booleans = Artist.new(name: "Booleans", album_name: "Ruby", song_name: "Scripture of J", promoter_id: tim.id, bio: bio.sample)
  booleans.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Still+Corners+-+Fireflies.mp3")
  booleans.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band4.jpg")
  booleans.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band2.jpg")
  booleans.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band12.jpg")
  booleans.uploaded_picture_4_url("https://s3.amazonaws.com/radion-college-radio/band6.jpg")
  booleans.uploaded_picture_5_url("https://s3.amazonaws.com/radion-college-radio/band10.jpg")
  booleans.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: booleans.id , station_id: rob.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: booleans.id , station_id: jimmy.id, reviewed: boolean.sample)

  corners = Artist.new(name: "Still Corners", album_name: "Fireflies", song_name: "Fireflies", promoter_id: tim.id, bio: bio.sample)
  corners.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Still+Corners+-+Fireflies.mp3")
  corners.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band5.jpg")
  corners.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band3.jpg")
  corners.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band1.jpg")
  corners.uploaded_picture_4_url("https://s3.amazonaws.com/radion-college-radio/band10.jpg")
  corners.uploaded_picture_5_url("https://s3.amazonaws.com/radion-college-radio/band7.jpg")
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

  frizzle = Artist.new(name: "Frizzle", album_name: "Fast Times", song_name: "Life Without You", promoter_id: sky.id, bio: bio.sample)
  frizzle.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Future+Islands+-+Tin+Man.mp3")
  frizzle.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band6.jpg")
  frizzle.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band4.jpg")
  frizzle.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band2.jpg")
  frizzle.uploaded_picture_4_url("https://s3.amazonaws.com/radion-college-radio/band12.jpg")
  frizzle.uploaded_picture_5_url("https://s3.amazonaws.com/radion-college-radio/band7.jpg")
  frizzle.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: frizzle.id , station_id: susie.id, reviewed: true, responded: true)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: frizzle.id , station_id: jimmy.id, reviewed: boolean.sample)

  lone = Artist.new(name: "Lone Stars", album_name: "Watch", song_name: "Stopping Elvis", promoter_id: sky.id, bio: bio.sample)
  lone.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Future+Islands+-+Tin+Man.mp3")
  lone.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band7.jpg")
  lone.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band5.jpg")
  lone.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band3.jpg")
  lone.uploaded_picture_4_url("https://s3.amazonaws.com/radion-college-radio/band11.jpg")
  lone.uploaded_picture_5_url("https://s3.amazonaws.com/radion-college-radio/band1.jpg")
  lone.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: lone.id , station_id: ida.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: lone.id , station_id: susie.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: lone.id , station_id: jimmy.id, reviewed: boolean.sample)

  islands = Artist.new(name: "Future Islands", album_name: "Islands", song_name: "Tin Man", promoter_id: sky.id, bio: bio.sample)
  islands.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Future+Islands+-+Tin+Man.mp3")
  islands.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band8.jpg")
  islands.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band6.jpg")
  islands.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band4.jpg")
  islands.uploaded_picture_4_url("https://s3.amazonaws.com/radion-college-radio/band9.jpg")
  islands.uploaded_picture_5_url("https://s3.amazonaws.com/radion-college-radio/band10.jpg")
  islands.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: islands.id , station_id: ida.id, reviewed: true, responded: true )
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: islands.id , station_id: susie.id, reviewed: boolean.sample)

thomas = Promoter.create!(name: "Thomas Jackson", email: "tjackson@vitriolpromotion.com", password: "password", company_name: "Vitriol Promotion",
  phone_number: "901-333-8117", station_ids: [bobby.id, rob.id, ida.id, jimmy.id, susie.id])
  thomas.picture_upload_url("https://s3.amazonaws.com/radion-college-radio/thomas.jpg")

  blues = Artist.new(name: "Blues Brothers", album_name: "Bros", song_name: "Life", promoter_id: thomas.id, bio: bio.sample)
  blues.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Yeasayer+-+2080.mp3")
  blues.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band9.jpg")
  blues.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band7.jpg")
  blues.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band5.jpg")
  blues.uploaded_picture_4_url("https://s3.amazonaws.com/radion-college-radio/band12.jpg")
  blues.uploaded_picture_5_url("https://s3.amazonaws.com/radion-college-radio/band1.jpg")
  blues.save

  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: blues.id , station_id: bobby.id, reviewed: true, responded: true)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: blues.id , station_id: rob.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: blues.id , station_id: jimmy.id, reviewed: boolean.sample)
  Feedback.create(comment: Faker::Company.catch_phrase, request: boolean.sample,
    artist_id: blues.id , station_id: ida.id, reviewed: boolean.sample)

  yeasayer = Artist.new(name: "Yeasayer", album_name: "Sayer", song_name: "2080", promoter_id: thomas.id, bio: bio.sample)
  yeasayer.uploaded_music_url("https://s3.amazonaws.com/radion-college-radio/Yeasayer+-+2080.mp3")
  yeasayer.uploaded_picture_1_url("https://s3.amazonaws.com/radion-college-radio/band10.jpg")
  yeasayer.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band8.jpg")
  yeasayer.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band6.jpg")
  yeasayer.uploaded_picture_2_url("https://s3.amazonaws.com/radion-college-radio/band3.jpg")
  yeasayer.uploaded_picture_3_url("https://s3.amazonaws.com/radion-college-radio/band1.jpg")
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
