if session[:user_type] == "stations" || (session[:user_type] == "promoters" && @artist.promoter_id == session[:user_id])
  json.(@artist, :id, :name, :promoter_id)
  json.promoter_name @artist.promoter.name
  json.(@artist, :uploaded_file, :created_at, :updated_at)
else
  json.errors "User has no access to this artist"
end
