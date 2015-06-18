require 'open-uri'
require 'csv'
class BikeRacksController < ApplicationController
  before_action :set_bike_rack, only: [:show, :edit, :update, :destroy]
  helper_method :populateBRData
 
  def populateBRData
    
    BikeRack.clearAllData

    brurl = "ftp://webftp.vancouver.ca/opendata/bike_rack/BikeRackData.csv"
    brfile = open(brurl)
    brstring = brfile.read

    brfile.close

    brArray = CSV.parse(brstring)
    newbrArray = brArray.drop(1)
    


    (0...1000).each do |i|
      temp = newbrArray[i]
      BikeRack.create(address: temp[0] + " " + temp[1] + ", " + "Vancouver" + " BC", quantity: temp[5])
    end


    # for i in newbrArray
      # sleep(0.2)   # to slow down the loop
      # BikeRack.create(address: i[0] + " " + i[1] + ", " + "Vancouver" + " BC", quantity: i[5])
    # end


      redirect_to bike_racks_path
    end



  def index
    @bike_racks = BikeRack.all

  end

  # first step
  def map
  @bike_racks = BikeRack.all
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
        format.html { redirect_to @bike_rack, notice: 'Bike rack was successfully created.' }
        format.json { render :show, status: :created, location: @bike_rack }
      else
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
        format.html { redirect_to @bike_rack, notice: 'Bike rack was successfully updated.' }
        format.json { render :show, status: :ok, location: @bike_rack }
      else
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
      format.html { redirect_to bike_racks_url, notice: 'Bike rack was successfully destroyed.' }
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
