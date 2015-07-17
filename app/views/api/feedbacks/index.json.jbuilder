json.array!(@feedbacks) do |feedback|
  json.(feedback, :id, :comment, :request, :reviewed, :responded)
  json.artist(feedback.artist, :id, :name, :album_name)
  json.station(feedback.station, :id, :name, :station_name, :picture_upload,
    :address_1, :address_2, :city, :state, :zipcode)
end
