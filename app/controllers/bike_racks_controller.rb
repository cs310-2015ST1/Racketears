require 'open-uri'
require 'csv'
class BikeRacksController < ApplicationController
  before_action :set_bike_rack, only: [:show, :edit, :update, :destroy]
  include BikeRacksHelper
  helper_method :populateBRData
  
 
  def populateBRData
  
    brurl = "ftp://webftp.vancouver.ca/opendata/bike_rack/BikeRackData.csv"
    brfile = open(brurl)
    brstring = brfile.read
    brfile.close
    
    parseCSV(brstring)
    
    redirect_to bike_racks_path
  end

    


  def index
    @bike_racks = BikeRack.all

  end

  # first step
  def map
    @bike_racks = BikeRack.all
    if (logged_in?)
      @user = current_user
    else
      @user = User.new
    end
  end

  def heatmap
    @bike_racks = BikeRack.all
  end

  # GET /bike_racks/1
  # GET /bike_racks/1.json
  def show

  end

  # GET /bike_racks/new
  def new
    @bike_rack = BikeRack.new
  end

  # GET /bike_racks/1/edit
  def edit
  end

  # POST /bike_racks
  # POST /bike_racks.json
  def create
    @bike_rack = BikeRack.new(bike_rack_params)

    respond_to do |format|
      if @bike_rack.save
        flash[:success] = 'Bike rack was successfully created.'
        format.html { redirect_to @bike_rack }
        format.json { render :show, status: :created, location: @bike_rack }
      else
        flash[:danger] = 'There was a problem with creating Bike rack.'
        format.html { render :new }
        format.json { render json: @bike_rack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bike_racks/1
  # PATCH/PUT /bike_racks/1.json
  def update
    respond_to do |format|
      if @bike_rack.update(bike_rack_params)
        flash[:success] = 'Bike rack was successfully updated.'
        format.html { redirect_to @bike_rack }
        format.json { render :show, status: :ok, location: @bike_rack }
      else
        flash[:danger] = 'There was a problem editing Bike rack.'
        format.html { render :edit }
        format.json { render json: @bike_rack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bike_racks/1
  # DELETE /bike_racks/1.json
  def destroy
    @bike_rack.destroy
    respond_to do |format|
      flash[:success] = 'Bike rack was successfully destroyed.'
      format.html { redirect_to bike_racks_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bike_rack
      @bike_rack = BikeRack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bike_rack_params
      params.require(:bike_rack).permit(:address, :quantity, :latitude, :longitude)
    end
end
