json.array!(@user_task_intermediates) do |user_task_intermediate|
  json.extract! user_task_intermediate, :id, :task_id, :user_id, :number, :description, :is_done
  json.url user_task_intermediate_url(user_task_intermediate, format: :json)
end
