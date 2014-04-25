json.array!(@packages) do |package|
  json.extract! package, :id, :destination, :description, :weight, :origin, :Expiry_Date, :value, :receiverAddress, :receivermobile, :receiverMail
  json.url package_url(create_package, format: :json)
end
