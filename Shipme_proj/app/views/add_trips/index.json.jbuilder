json.array!(@add_trips) do |add_trip|
  json.extract! add_trip, :id, :Location, :Destination, :TravellingDate, :MaximumWeight
  json.url add_trip_url(add_trip, format: :json)
end
