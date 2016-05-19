json.array!(@calls) do |call|
  json.extract! call, :id, :phone, :called_at, :duration, :internal_id, :call_type_id, :rings
  json.url call_url(call, format: :json)
end
