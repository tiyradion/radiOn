json.user_id "#{session[:user_id]}"
json.user_type "#{session[:user_type]}"
json.array!(@artists) do |artist|
  json.(artist, :id, :name)
  json.url api_artist_url(artist)
end
