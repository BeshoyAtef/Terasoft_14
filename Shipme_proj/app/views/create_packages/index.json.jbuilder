json.array!(@create_packages) do |create_package|
  json.extract! create_packages, :id, :destination, :description, :weight, :origin, :Expiry_Date, :value, :receiverAddress, :receivermobile, :receiverMail
  json.url create_packages_url(create_packages, format: :json)
end
