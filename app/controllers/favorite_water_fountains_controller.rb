class FavoriteWaterFountainsController < ApplicationController
	  before_action :set_water_fountain
  
  def create
    if Favorite.create(favorited: @water_fountain, user: current_user)
      redirect_to @water_fountain, notice: 'Water Fountain has been favorited'
    else
      redirect_to @water_fountain, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @water_fountain.id, user_id: current_user.id).first.destroy
    redirect_to @water_fountain, notice: 'Water Fountain is no longer in favorites'
  end

  helper_method :create
  
  private
  
  def set_water_fountain
    @water_fountain = WaterFountain.find(params[:water_fountain_id] || params[:id])
  end
end
