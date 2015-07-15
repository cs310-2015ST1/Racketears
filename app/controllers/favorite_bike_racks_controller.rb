class FavoriteBikeRacksController < ApplicationController
    before_action :set_bike_rack
  
  def create
    if Favorite.create(favorited: @bike_rack, user: current_user)
      redirect_to @bike_rack, notice: 'Bike Rack has been favorited'
    else
      redirect_to @bike_rack, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @bike_rack.id, user_id: current_user.id).first.destroy
    redirect_to @bike_rack, notice: 'Bike Rack is no longer in favorites'
  end

  helper_method :create
  
  private
  
  def set_bike_rack
    @bike_rack = BikeRack.find(params[:bike_rack_id] || params[:id])
  end
end
