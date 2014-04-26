json.array!(@packages) do |package|
  json.extract! package, :id, :expiryDate, :description, :destination, :origin, :receiverAddress, :receiverMobNumber, :receiverEmail, :receivedByCarrier, :finalDelivery, :weight, :type, :carryingPrice, :packageValue, :rating, :senders_id, :carriers
  json.url package_url(package, format: :json)
end
