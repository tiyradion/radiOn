json.array!(@artists) do |artist|
  json.(artist, :id, :name, :album_name, :song_name)
  json.music_upload_file artist.uploaded_file
  json.url api_artist_url(artist)
end
