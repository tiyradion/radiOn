json.array!(@rankings) do |ranking|
  json.(ranking, :id, :rank, :station_id, :artist_id)
  json.dj_name ranking.station.name
  json.(ranking.station, :station_name)
  if ranking.artist.present? == true
    json.artist_name ranking.artist.name
    json.(ranking.artist, :album_name, :song_name)
  end
end
