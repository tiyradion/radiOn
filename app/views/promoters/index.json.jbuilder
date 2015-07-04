json.array!(@promoters) do |promoter|
  json.extract! promoter, :id
  json.url promoter_url(promoter, format: :json)
end
