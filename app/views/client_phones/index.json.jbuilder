json.array!(@client_phones) do |client_phone|
  json.extract! client_phone, :id, :client_id, :phone
  json.url client_phone_url(client_phone, format: :json)
end
