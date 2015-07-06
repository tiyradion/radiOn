json.array!(@stations) do |station|
  json.extract! station, :id, :name, :email, :password_digest
  json.url station_url(station, format: :json)
end
