class FirendRelationship < ActiveRecord::Base
	belongs_to :user
	has_many   :alert_task

	validates :user_id,:presence => true
	validates :firend ,:presence => true

	before_save :judgement_user_exist,:is_friend_myself,:is_firend?

protected
	def judgement_user_exist
		return false if User.find_by_id(user_id).nil? or User.find_by_id(user_id).blank?
		return false if User.find_by_id(firend).nil? or User.find_by_id(firend).blank?
	end

	def is_friend_myself
		return false if user_id === firend
	end

	def is_firend?
		return false unless FirendRelationship.find_by_firend_and_user_id(firend,user_id).nil? or \
						FirendRelationship.find_by_firend_and_user_id(firend,user_id).blank?
	end


end
