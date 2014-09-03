class UserTaskIntermediate < ActiveRecord::Base
	# I don't know,But I can try
	belongs_to :user
	belongs_to :task
	has_many   :alert_task

	before_save :judgement_user_task_exist
	

protected

	def judgement_user_task_exist
		return false if User.find_by_id(user_id).nil? or User.find_by_id(user_id).blank?
     	return false if Task.find_by_id(task_id).nil? or Task.find_by_id(task_id).blank?
	end
	
end
