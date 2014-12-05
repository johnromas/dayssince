json.array!(@records) do |record|
  json.extract! record, :id, :count, :goal_id, :active
  json.url record_url(record, format: :json)
end
