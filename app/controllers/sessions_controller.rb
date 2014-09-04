class SessionsController < ApplicationController
	def index
	end
	
	def new
		if session[:user_id] != nil 
			flash.now[:success] = "has being login"
 			redirect_to sessions_path
		end
	end

	def create

		@user = User.authentication(params[:login],params[:password])
		if @user 
			session[:user_id] = @user.id
			flash.now[:success] = "Welcome #{@user.login}"
			redirect_to sessions_path
		else
			render text: "The login or password is not correct."
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to new_session_path
	end
end
