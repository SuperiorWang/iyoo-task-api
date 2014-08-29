class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.authentication(params[:login],params[:password])
		if @user 
			session[:user_id] = @user.id
			render text: "Welcome #{@user.login}"
		else
			render text: "The login or password is not correct."
		end

	end
end
