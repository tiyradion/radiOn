json.(@artist, :id, :name, :promoter_id)
json.promoter_name @artist.promoter.name
json.music_upload_file @artist.uploaded_file
json.(@artist, :created_at, :updated_at)
