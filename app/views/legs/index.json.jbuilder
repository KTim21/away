json.array!(@legs) do |leg|
  json.extract! leg, :id, :description, :distance
  json.url leg_url(leg, format: :json)
end
