json.array!(@internals) do |internal|
  json.extract! internal, :id, :name, :sector_id
  json.url internal_url(internal, format: :json)
end
