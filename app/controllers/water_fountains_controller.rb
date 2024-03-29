require 'open-uri'
require 'csv'
class WaterFountainsController < ApplicationController
  before_action :set_water_fountain, only: [:show, :edit, :update, :destroy]
  include WaterFountainsHelper


  def populateWFData

    WaterFountain.clearAllData

    wfurl = "ftp://webftp.vancouver.ca/OpenData/csv/drinking_fountains.csv"
    wffile = open(wfurl) 
    wfstring = wffile.read

    wffile.close

    parse_wf_csv(wfstring)

    redirect_to waterfountains_path
end


  # GET /water_fountains
  # GET /water_fountains.json
  def index
    @water_fountains = WaterFountain.all
  end

  def map 
    @water_fountains = WaterFountain.all
    if (logged_in?)
      @user = current_user
    else
      @user = User.new
    end
  end


  def heatmap
    @water_fountains = WaterFountain.all
  end


  # GET /water_fountains/1
  # GET /water_fountains/1.json
  def show
  end

  # GET /water_fountains/new
  def new
    @water_fountain = WaterFountain.new
  end

  # GET /water_fountains/1/edit
  def edit
  end

  # POST /water_fountains
  # POST /water_fountains.json
  def create
    @water_fountain = WaterFountain.new(water_fountain_params)

    respond_to do |format|
      if @water_fountain.save
        flash[:success] = 'Water fountain was successfully created.'
        format.html { redirect_to @water_fountain }
        format.json { render :show, status: :created, location: @water_fountain }
      else
        flash[:danger] = 'There was a problem creating Water fountain.'
        format.html { render :new }
        format.json { render json: @water_fountain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /water_fountains/1
  # PATCH/PUT /water_fountains/1.json
  def update
    respond_to do |format|
      if @water_fountain.update(water_fountain_params)
        flash[:success] = 'Water fountain was successfully edited.'
        format.html { redirect_to @water_fountain }
        format.json { render :show, status: :ok, location: @water_fountain }
      else
        flash[:danger] = 'There was a problem editing Water fountain.'
        format.html { render :edit }
        format.json { render json: @water_fountain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /water_fountains/1
  # DELETE /water_fountains/1.json
  def destroy
    @water_fountain.destroy
    respond_to do |format|
      flash[:success] = 'Water fountain was successfully destroyed.'
      format.html { redirect_to water_fountains_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_water_fountain
      @water_fountain = WaterFountain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def water_fountain_params
      params.require(:water_fountain).permit(:location, :lat, :lon)
    end

end
