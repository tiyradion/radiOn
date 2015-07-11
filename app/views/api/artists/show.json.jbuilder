json.(@artist, :id, :name, :promoter_id)
json.promoter_name @artist.promoter.name
json.(@artist, :uploaded_file, :created_at, :updated_at)
