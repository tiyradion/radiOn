json.array!(@stations) do |station|
  json.extract! station, :id
  json.url station_url(station, format: :json)
end
