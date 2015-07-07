json.array!(@promoters) do |promoter|
  json.(promoter, :id, :name, :email)
  json.url api_promoter_url(promoter)
end
