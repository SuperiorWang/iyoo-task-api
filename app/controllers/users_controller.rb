class UsersController < ApplicationController
	before_action :init,only: [:my_notice,:notice_friend]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def my_notice
		@social_records = @user.social_record.where("user_id = ?",params[:id])
	end

	def notice_friend
		@social_records = @user.social_record.where("friend_id = ?",params[:id])
	end

private
	def init
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:login,:hashed_password)
	end	

end
