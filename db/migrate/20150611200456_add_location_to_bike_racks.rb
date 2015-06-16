class AddLocationToBikeRacks < ActiveRecord::Migration
  def change
    add_column :bike_racks, :latitude, :float
    add_column :bike_racks, :longitude, :float
  end
end
