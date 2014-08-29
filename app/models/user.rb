class User < ActiveRecord::Base

	has_many :user_task_intermediate
	has_many :firend_relationship


	validates :login,:presence => true ,
					 :numericality => { only_integer: true} ,
					 :uniqueness => true,
					 :length => { is: 11, :wrong_length => "请输入正确手机号码"}
	validates :hashed_password,:presence => true,
							   :length => { in: 6..20, too_long: "密码太长超出范围", too_short: "密码不够6个字符"}


	def self.authentication(login,password)
		user = User.find_by_login(login)
		if user && password == user.hashed_password
			user
		else
			false
		end
	end
 
end
