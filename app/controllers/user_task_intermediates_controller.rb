class UserTaskIntermediatesController < ApplicationController
  before_action :set_user_task_intermediate, only: [:show, :edit, :update, :destroy,:update_number,:change_number]

  # GET /user_task_intermediates
  # GET /user_task_intermediates.json
  def index
    @user = User.find_by_id(session[:user_id])
    @user_task_intermediates = @user.user_task_intermediate.all if @user
  end

  # GET /user_task_intermediates/1
  # GET /user_task_intermediates/1.json
  def show
  end

  # GET /user_task_intermediates/new
  def new
    render text:"请登录" unless @user = User.find_by_id(session[:user_id])
    @user_task_intermediate = @user.user_task_intermediate.new
  end

  # GET /user_task_intermediates/1/edit
  def edit
    @user = User.find_by_id(session[:user_id])
  end

  # POST /user_task_intermediates
  # POST /user_task_intermediates.json
  def create

    @user_task_intermediate = UserTaskIntermediate.new(user_task_intermediate_params)

    respond_to do |format|
      if @user_task_intermediate.save
        format.html { redirect_to user_user_task_intermediates_path, notice: 'User task intermediate was successfully created.' }
        format.json { render :show, status: :created, location: @user_task_intermediate }
      else
        format.html { render :new }
        format.json { render json: @user_task_intermediate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_task_intermediates/1
  # PATCH/PUT /user_task_intermediates/1.json
  def update
    respond_to do |format|
      if @user_task_intermediate.update(user_task_intermediate_params)
        format.html { redirect_to user_user_task_intermediates_path, notice: 'User task intermediate was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_task_intermediate }
      else
        flash.now[:error] = 'update failed'
        format.html { redirect_to edit_user_user_task_intermediate_path }
      end
    end
  end

  def change_number
  end

  def update_number
    
     if @user_task_intermediate.update_attributes(number: params[:user_task_intermediate]['number'])
        redirect_to @user_task_intermediate
      else
        render 'change_number'
      end

  end

  # DELETE /user_task_intermediates/1
  # DELETE /user_task_intermediates/1.json
  def destroy
    @user_task_intermediate.destroy
    respond_to do |format|
      format.html { redirect_to user_user_task_intermediates_url, notice: 'User task intermediate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_task_intermediate
      @user_task_intermediate = UserTaskIntermediate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_task_intermediate_params
      params.require(:user_task_intermediate).permit(:task_id, :user_id, :number, :description, :is_done)
    end
end
