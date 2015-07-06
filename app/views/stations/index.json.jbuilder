json.array!(@stations) do |station|
<<<<<<< HEAD
  json.extract! station, :id
=======
  json.extract! station, :id, :name, :email, :password_digest
>>>>>>> master
  json.url station_url(station, format: :json)
end
