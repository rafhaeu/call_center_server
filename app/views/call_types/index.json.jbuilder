json.array!(@call_types) do |call_type|
  json.extract! call_type, :id, :name
  json.url call_type_url(call_type, format: :json)
end
