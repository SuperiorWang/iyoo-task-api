class UserTaskIntermediatesController < ApplicationController
  before_action :set_user_task_intermediate, only: [:show, :edit, :update, :destroy,:update_number,:change_number]

  # GET /user_task_intermediates
  # GET /user_task_intermediates.json
  def index
    @user_task_intermediates = UserTaskIntermediate.all
  end

  # GET /user_task_intermediates/1
  # GET /user_task_intermediates/1.json
  def show
  end

  # GET /user_task_intermediates/new
  def new
    @user_task_intermediate = UserTaskIntermediate.new
  end

  # GET /user_task_intermediates/1/edit
  def edit
  end

  # POST /user_task_intermediates
  # POST /user_task_intermediates.json
  def create

    @user_task_intermediate = UserTaskIntermediate.new(user_task_intermediate_params)

    respond_to do |format|
      if @user_task_intermediate.save
        format.html { redirect_to @user_task_intermediate, notice: 'User task intermediate was successfully created.' }
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
        format.html { redirect_to @user_task_intermediate, notice: 'User task intermediate was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_task_intermediate }
      else
        format.html { render :edit }
        format.json { render json: @user_task_intermediate.errors, status: :unprocessable_entity }
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
      format.html { redirect_to user_task_intermediates_url, notice: 'User task intermediate was successfully destroyed.' }
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
