class AlertTask < ActiveRecord::Base
	belongs_to :user_task_intermediate
	belongs_to :firend_relationship

	validates :user_task_intermediate_id,:presence => true
	validates :friend_relationship_id,:presence => true

	before_save :is_user_task_intermediate_id,:is_friend_relationship_id

private
	def is_user_task_intermediate_id
		return false if UserTaskIntermediate.find_by_id(user_task_intermediate_id).blank? or \
						UserTaskIntermediate.find_by_id(user_task_intermediate_id).nil?
	end

	def is_friend_relationship_id
		return false if FirendRelationship.find_by_id(friend_relationship_id).blank? or \
						FirendRelationship.find_by_id(friend_relationship_id).nil?
	end

end
