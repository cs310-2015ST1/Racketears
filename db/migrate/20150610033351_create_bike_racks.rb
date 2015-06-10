class CreateBikeRacks < ActiveRecord::Migration
  def change
    create_table :bike_racks do |t|
      t.text :address
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
