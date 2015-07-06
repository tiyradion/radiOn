json.array!(@promoters) do |promoter|
  json.extract! promoter, :id, :name, :email, :password_digest
  json.url promoter_url(promoter, format: :json)
end
