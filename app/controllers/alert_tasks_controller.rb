class AlertTasksController < ApplicationController
	before_action :set_alert_tasks ,only[]
	
	def new
		@alert_task = AlertTask.new
	end

	def create
	end


private
	def set_alert_tasks
		@alert_task = AlertTask.find_by_id(params[:id])
	end
end
