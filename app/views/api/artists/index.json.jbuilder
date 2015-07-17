json.array!(@artists) do |artist|
  json.(artist, :id, :name, :album_name, :song_name, :bio)
  json.music_upload_file artist.uploaded_file
  json.picture_upload_1_file artist.picture_upload_1
  json.picture_upload_2_file artist.picture_upload_2
  json.picture_upload_3_file artist.picture_upload_3
  json.picture_upload_4_file artist.picture_upload_2
  json.picture_upload_5_file artist.picture_upload_3
  json.url api_artist_url(artist)
  json.promoter artist.promoter, partial: 'api/promoters/promoter', as: :promoter
end
