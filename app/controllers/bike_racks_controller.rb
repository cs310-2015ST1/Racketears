class BikeRacksController < ApplicationController
  before_action :set_bike_rack, only: [:show, :edit, :update, :destroy]
  helper_method :parse, :imgStr

  # GET /bike_racks
  # GET /bike_racks.json
  def index
    @bike_racks = BikeRack.all
  end

  # GET /mapracks
  def map
    @bike_racks = BikeRack.all
    @hash = Gmaps4rails.build_markers(@bike_racks) do |bike_rack, marker|
      marker.lat bike_rack.latitude
      marker.lng bike_rack.longitude
      marker.infowindow bike_rack.quantity.to_s+' racks at this location'
    end
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


  def parse(br)
    toParse = br.address
    parseArr = toParse.split
  end

  def imgStr(arr)
    "https://maps.googleapis.com/maps/api/staticmap?center=" + arr.first.to_s + "+" + arr.second.to_s + "+" + arr.last.to_s + ",BC&zoom=14&size=300x300&markers=" + arr.first.to_s + "+" + arr.second.to_s + "+" + arr.last.to_s + ",BC&sensor=false"
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
