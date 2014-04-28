json.array!(@users) do |user|
  json.extract! user, :id, :creditCard, :mobileNumber, :idNumber
  json.url user_url(user, format: :json)
end
