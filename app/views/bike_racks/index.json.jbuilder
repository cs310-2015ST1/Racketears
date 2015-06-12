json.array!(@bike_racks) do |bike_rack|
  json.extract! bike_rack, :id, :address, :quantity, :latitude, :longitude
  json.url bike_rack_url(bike_rack, format: :json)
end
