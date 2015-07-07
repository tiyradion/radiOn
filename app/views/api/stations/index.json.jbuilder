json.array!(@stations) do |station|
  json.(station, :id, :name, :email)
  json.url api_station_url(station)
end
