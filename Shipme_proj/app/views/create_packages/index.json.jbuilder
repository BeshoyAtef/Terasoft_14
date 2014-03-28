json.array!(@create_packages) do |create_package|
  json.extract! create_package, :id, :destination, :description, :weight, :origin, :Expiry_Date, :value, :receiverAddress, :receivermobile, :receiverMail
  json.url create_package_url(create_package, format: :json)
end
