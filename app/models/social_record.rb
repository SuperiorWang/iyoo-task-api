class SocialRecord < ActiveRecord::Base
	belongs_to :user
	belongs_to :task

	validates :task_id,   :presence => true, numericality: {only_integer: true}
	validates :user_id,   :presence => true, numericality: {only_integer: true}
	validates :friend_id, :presence => true, numericality: {only_integer: true}

	before_save :validates_user,:validates_friend

private 
	# 验证用户是否存在
	def validates_user
		# return false if user_id != session[:user_id]
		return false if User.find_by_id(user_id).blank? or User.find_by_id(user_id).nil?
	end

	# 验证好友是否存在
	def validates_friend
		return false if User.find_by_id(friend_id).blank? or User.find_by_id(friend_id).nil?
	end
end
