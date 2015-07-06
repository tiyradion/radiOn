<<<<<<< HEAD
json.(@station, :id, :name, :created_at, :updated_at)
json.promoters @promoters do |promoter|
  json.promoter promoter.name
  json.artists promoter.artists do |artist|
    json.artist artist.name
  end
end
=======
json.extract! @station, :id, :name, :email, :password_digest, :created_at, :updated_at
>>>>>>> master
