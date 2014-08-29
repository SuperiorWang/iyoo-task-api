json.array!(@firend_relationships) do |firend_relationship|
  json.extract! firend_relationship, :id, :user_id, :firend
  json.url firend_relationship_url(firend_relationship, format: :json)
end
