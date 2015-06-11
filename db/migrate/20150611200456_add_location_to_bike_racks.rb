class AddLocationToBikeRacks < ActiveRecord::Migration
  def change
    add_column :bike_racks, :latitude, :double
    add_column :bike_racks, :longitude, :double
  end
end
