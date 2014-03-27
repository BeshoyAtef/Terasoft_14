json.array!(@reports) do |report|
  json.extract! report, :id, :Reporter, :Reporting, :PackageNo, :Report
  json.url report_url(report, format: :json)
end
