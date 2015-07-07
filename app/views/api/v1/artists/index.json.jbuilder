json.array!(@artists) do |artist|
  json.(artist, :id, :name)
  json.url artist_url(artist, format: :json)
end
