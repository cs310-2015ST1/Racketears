require 'open-uri'
require 'csv'
class WaterFountainsController < ApplicationController
  before_action :set_water_fountain, only: [:show, :edit, :update, :destroy]
  helper_method :parseLatLon, :imgStr, :populateWFData, :shortenLocation


  def populateWFData
    wfurl = "ftp://webftp.vancouver.ca/OpenData/csv/drinking_fountains.csv"
    wffile = open(wfurl) 
    wfstring = wffile.read
    csvArray = CSV.parse(wfstring)
    newArray = csvArray.drop(1)
for i in newArray
  WaterFountain.create(location: i[2].force_encoding('iso-8859-1').encode('utf-8'), lat: i[0].to_f, lon: i[1].to_f)
end
#arrayIndex = newArray.size - 1
# 227..228 doesnt work
# 228..229 doesnt work 
# all others work therefore it is the element 228 which is 230 in file
#(0...228).each do |i|
# temp = newArray[i]
#  WaterFountain.create(location: temp[2], lat: temp[0].to_f, lon: temp[1].to_f)
#end
#(229..233).each do |i|
# temp = newArray[i]
#  WaterFountain.create(location: temp[2], lat: temp[0].to_f, lon: temp[1].to_f)
#end
end


  # GET /water_fountains
  # GET /water_fountains.json
  def index
    @water_fountains = WaterFountain.all
  end

  def map 
    @water_fountains = WaterFountain.all
    @hash = Gmaps4rails.build_markers(@water_fountains) do |water_fountain, marker|
      marker.lat water_fountain.lat
      marker.lng water_fountain.lon
      marker.infowindow water_fountain.location+' park'
      end
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
        format.html { redirect_to @water_fountain, notice: 'Water fountain was successfully created.' }
        format.json { render :show, status: :created, location: @water_fountain }
      else
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
        format.html { redirect_to @water_fountain, notice: 'Water fountain was successfully updated.' }
        format.json { render :show, status: :ok, location: @water_fountain }
      else
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
      format.html { redirect_to water_fountains_url, notice: 'Water fountain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def parseLatLon(wf)
    tempLat = wf.lat
    tempLon = wf.lon
    arr = [tempLat, tempLon]
    arr
  end

  def imgStr(arr)
    "https://maps.googleapis.com/maps/api/staticmap?center=" + arr.first.to_s + "," + arr.last.to_s + "&zoom=14&size=300x300&markers=" + arr.first.to_s + "," + arr.last.to_s + "&sensor=false"
  end

  def shortenLocation(string)
    string.partition(":").last
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
