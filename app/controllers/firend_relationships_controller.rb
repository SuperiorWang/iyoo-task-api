class FirendRelationshipsController < ApplicationController
  before_action :set_firend_relationship, only: [:show, :edit, :update, :destroy]

  # GET /firend_relationships
  # GET /firend_relationships.json
  def index
    @user = User.find_by_id(session[:user_id])
    @firend_relationships = @user.firend_relationship.all if @user
  end

  # GET /firend_relationships/1
  # GET /firend_relationships/1.json
  def show
  end

  # GET /firend_relationships/new
  def new
    render text:"请登录" unless @user = User.find_by_id(session[:user_id])
    @firend_relationship = @user.firend_relationship.new
  end

  # GET /firend_relationships/1/edit
  def edit
    @user = User.find_by_id(session[:user_id])
  end

  # POST /firend_relationships
  # POST /firend_relationships.json
  def create
    @user = User.find_by_id(session[:user_id])
    @firend_relationship = @user.firend_relationship.new(firend_relationship_params)

    respond_to do |format|
      if @firend_relationship.save
        format.html { redirect_to user_firend_relationships_path, notice: 'Firend relationship was successfully created.' }
        format.json { render :show, status: :created, location: @user_firend_relationships }
      else
        format.html { render :new }
        format.json { render json: @firend_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /firend_relationships/1
  # PATCH/PUT /firend_relationships/1.json
  def update
    respond_to do |format|
      if @firend_relationship.update(firend_relationship_params)
        puts "update"
        format.html { redirect_to user_firend_relationship_path, notice: 'Firend relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @firend_relationship }
      else
        puts "not update"
        format.html { redirect_to edit_user_firend_relationship_path }
        format.json { render json: @firend_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firend_relationships/1
  # DELETE /firend_relationships/1.json
  def destroy
    @firend_relationship.destroy
    respond_to do |format|
      format.html { redirect_to user_firend_relationships_url, notice: 'Firend relationship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_firend_relationship
      @firend_relationship = FirendRelationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def firend_relationship_params
      params.require(:firend_relationship).permit(:user_id, :firend)
    end
end
