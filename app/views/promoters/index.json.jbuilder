json.array!(@promoters) do |promoter|
<<<<<<< HEAD
  json.extract! promoter, :id
=======
  json.extract! promoter, :id, :name, :email, :password_digest
>>>>>>> master
  json.url promoter_url(promoter, format: :json)
end
