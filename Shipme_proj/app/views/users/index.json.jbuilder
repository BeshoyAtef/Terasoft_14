json.array!(@users) do |user|
  json.extract! user, :id, :creditCard, :mobileNumber, :user_Id
  json.url user_url(user, format: :json)
end
