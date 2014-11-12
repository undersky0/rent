json.array!(@locations) do |location|
  json.extract! location, :id, :address, :google_address, :postcode, :latitude, :longitude
  json.url location_url(location, format: :json)
end
