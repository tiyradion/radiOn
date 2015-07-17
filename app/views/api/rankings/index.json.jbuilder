json.array!(@rankings) do |ranking|
  json.(ranking, :id, :rank)
  json.(ranking.station, :id, :name, :station_name)
  json.(ranking.artist, :id, :name, :album_name, :song_name)
end
