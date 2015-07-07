json.array!(@artists) do |artist|
  json.(artist, :id, :name)
  json.url api_artist_url(artist)
end
