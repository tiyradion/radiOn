json.array!(@promoters) do |promoter|
  json.(promoter, :id, :name, :company_name, :email, :picture_upload,
  :phone_number)
end
