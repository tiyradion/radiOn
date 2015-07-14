json.array!(@promoter.requests) do |request|
  artist = Artist.find_by_id(request.artist_id)
  station = Station.find_by_id(request.station_id)
  json.(station, :id, :name, :station_name, :email, :address_1, :address_2, :city,
    :state, :zipcode, :phone_number)
  json.artist id: artist.id, name: artist.name, album_name: artist.album_name
end
