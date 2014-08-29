class FirendRelationshipsController < ApplicationController
  before_action :set_firend_relationship, only: [:show, :edit, :update, :destroy]

  # GET /firend_relationships
  # GET /firend_relationships.json
  def index
    @firend_relationships = FirendRelationship.all
  end

  # GET /firend_relationships/1
  # GET /firend_relationships/1.json
  def show
  end

  # GET /firend_relationships/new
  def new
    render text:"请登录" unless @user = User.find_by_id(session[:user_id])
    @firend_relationship = FirendRelationship.new
  end

  # GET /firend_relationships/1/edit
  def edit
  end

  # POST /firend_relationships
  # POST /firend_relationships.json
  def create
    @firend_relationship = FirendRelationship.new(firend_relationship_params)

    respond_to do |format|
      if @firend_relationship.save
        format.html { redirect_to @firend_relationship, notice: 'Firend relationship was successfully created.' }
        format.json { render :show, status: :created, location: @firend_relationship }
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
        format.html { redirect_to @firend_relationship, notice: 'Firend relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @firend_relationship }
      else
        format.html { render :edit }
        format.json { render json: @firend_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firend_relationships/1
  # DELETE /firend_relationships/1.json
  def destroy
    @firend_relationship.destroy
    respond_to do |format|
      format.html { redirect_to firend_relationships_url, notice: 'Firend relationship was successfully destroyed.' }
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
