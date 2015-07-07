json.(@promoter, :id, :name, :created_at, :updated_at)
json.artists @promoter.artists do |artist|
  json.name artist.name
  json.comments artist.comments do |comment|
    json.comment comment.description
    json.station comment.station.name
  end
end
