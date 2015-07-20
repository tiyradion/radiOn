json.array!(@promoter.stations) do |station|
  json.(station, :id, :name, :station_name, :email, :picture_upload,
    :phone_number, :address_1, :address_2, :city, :state, :zipcode)
  # json.unresponded station.unresponded_feedback(@promoter.id).count
end
