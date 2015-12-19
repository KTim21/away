json.array!(@photos) do |photo|
  json.extract! photo, :id, :title, :leg_id
  json.url photo_url(photo, format: :json)
end
