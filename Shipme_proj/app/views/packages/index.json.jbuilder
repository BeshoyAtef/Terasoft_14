json.array!(@packages) do |package|
  json.extract! package, :id, :destination, :description, :weight, :origin, :ExpiryDate, :value, :receiverAddress, :receiverMobile, :receiverMail, :ReceiverAccount
  json.url package_url(package, format: :json)
end
