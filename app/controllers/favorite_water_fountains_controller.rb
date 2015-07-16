class FavoriteWaterFountainsController < ApplicationController
	  before_action :set_water_fountain
  
  def create
    if Favorite.create(favorited: @water_fountain, user: current_user)
      flash[:success] = 'Water Fountain has been favorited'
      redirect_to @water_fountain
    else
      flash[:danger] = 'Something went wrong...*sad panda*'
      redirect_to @water_fountain
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @water_fountain.id, user_id: current_user.id).first.destroy
    flash[:success] = 'Water Fountain is no longer in favorites'
    redirect_to @water_fountain
  end
  
  private
  
  def set_water_fountain
    @water_fountain = WaterFountain.find(params[:water_fountain_id] || params[:id])
  end
end
