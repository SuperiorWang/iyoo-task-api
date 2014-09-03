class AlertTasksController < ApplicationController
	before_action :init ,only: [:index,:new,:create,:show,:edit,:update]
	before_action :set_alert_tasks, only: [:show,:edit,:update,:destroy]
	
	def index
		@alert_tasks = @friend.alert_task.all if @friend
	end

	def new
		@alert_task = @friend.alert_task.build
	end

	def show
	end

	def edit
		@alert_task = @friend.alert_task.find_by_id(params[:id])
	end

	def create
		@alert_task = @friend.alert_task.new(alert_task_params)
		if @alert_task.save
			redirect_to user_firend_relationship_alert_tasks_path
		else
			render 'new'
		end
	end

	def update
		if @alert_task.update(alert_task_params)
			redirect_to user_firend_relationship_alert_task_path
		else
			flash.now[:error] = "update error"
			redirect_to edit_user_firend_relationship_alert_task_path
		end
	end

	def destroy
		@alert_task.destroy
			respond_to do |format|
				format.html { redirect_to user_firend_relationship_alert_tasks_url, notice: 'User task intermediate was successfully destroyed.'}
      			format.json { head :no_content }
		end
	end


private
	def init
		@user = User.find_by_id(session[:user_id])
		@friend = @user.firend_relationship.find_by_id(params[:firend_relationship_id]) if @user
	end

	def set_alert_tasks
		@alert_task = AlertTask.find(params[:id])
	end

	def alert_task_params
		params.require(:alert_task).permit(:user_task_intermediate_id,:friend_relationship_id,:has_alert)
	end
end
