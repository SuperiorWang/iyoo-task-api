class PersonalDataController < ApplicationController
  before_action :set_personal_datum, only: [:show, :edit, :update, :destroy]

  # GET /personal_data
  # GET /personal_data.json
  def index
    @personal_data = PersonalDatum.all
  end

  # GET /personal_data/1
  # GET /personal_data/1.json
  def show
  end

  # GET /personal_data/new
  def new
    @personal_datum = PersonalDatum.new
  end

  # GET /personal_data/1/edit
  def edit
  end

  # POST /personal_data
  # POST /personal_data.json
  def create
    @personal_datum = PersonalDatum.new(personal_datum_params)

    respond_to do |format|
      if @personal_datum.save
        format.html { redirect_to @personal_datum, notice: 'Personal datum was successfully created.' }
        format.json { render :show, status: :created, location: @personal_datum }
      else
        format.html { render :new }
        format.json { render json: @personal_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_data/1
  # PATCH/PUT /personal_data/1.json
  def update
    respond_to do |format|
      if @personal_datum.update(personal_datum_params)
        format.html { redirect_to @personal_datum, notice: 'Personal datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_datum }
      else
        format.html { render :edit }
        format.json { render json: @personal_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_data/1
  # DELETE /personal_data/1.json
  def destroy
    @personal_datum.destroy
    respond_to do |format|
      format.html { redirect_to personal_data_url, notice: 'Personal datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_datum
      @personal_datum = PersonalDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_datum_params
      params.require(:personal_datum).permit(:nickname, :sex, :region, :treasure, :friend_number, :phone_number, :login_password)
    end
end
