class SocialRecordsController < ApplicationController
  before_action :init,only: [:index,:new,:create,:edit]
  before_action :getSocial_record ,only: [:show,:edit,:update,:destroy]


  def index 
  	@social_records = @user.social_record.all if @user
  end

  def new 
  	@social_record = @user.social_record.build if @user
  end 

  def show 
  end

  def edit 
  end 

  def create 
  	@social_record = @user.social_record.new(social_record_params) 
  	if @social_record.save 
  		redirect_to user_social_records_path 
  	else 
  		flash.now[:notice] = "create error : didn't save" 
  		render 'new' 
  	end 
  end 

  def update
  	if @social_record.update(social_record_params)
  		redirect_to user_social_records_path
  	else
  		flash.now[:notice] = "update error : didn't update"
  		render 'edit'
  	end
  end

  def destroy
  	return redirect_to user_social_records_path if @social_record.destroy
  	flash.new[:notice] = "destroy error"
  	render 'index'
  end

 private
 	def init 
 		@user = User.find_by_id(session[:user_id]) 
 	end 

 	def getSocial_record
 		@social_record = SocialRecord.find_by_id(params[:id])
 	end

 	def social_record_params 
 		params.require(:social_record).permit(:task_id,:user_id,:friend_id,:pinch,:award) 
 	end 
 	 
end
