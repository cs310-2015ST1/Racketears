class FavoriteBikeRacksController < ApplicationController
    before_action :set_bike_rack
  
  def create
    if Favorite.create(favorited: @bike_rack, user: current_user)
      flash[:success] = 'Bike Rack has been favorited'
      redirect_to @bike_rack
    else
      flash[:danger] ='Something went wrong...*sad panda*'
      redirect_to @bike_rack
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @bike_rack.id, user_id: current_user.id).first.destroy
    flash[:success] = 'Bike Rack is no longer in favorites'
    redirect_to @bike_rack
  end

  helper_method :create
  
  private
  
  def set_bike_rack
    @bike_rack = BikeRack.find(params[:bike_rack_id] || params[:id])
  end
end
