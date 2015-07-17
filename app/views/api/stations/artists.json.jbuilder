json.array!(@artists) do |artist|
  json.(artist, :id, :name, :album_name, :song_name, :promoter_id)
  json.promoter_name artist.promoter.name
  json.music_upload_file artist.uploaded_file
  json.picture_upload_1_file artist.picture_upload_1
  json.picture_upload_2_file artist.picture_upload_2
  json.picture_upload_3_file artist.picture_upload_3
  json.url api_artist_url(artist)
end
