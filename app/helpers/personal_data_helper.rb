module PersonalDataHelper
	def uniqueness_personal
		@user = User.find(user)
		@personal_data = @user.personal_data.all
		return true if @personal_data.blank?
		return false
	end

end
