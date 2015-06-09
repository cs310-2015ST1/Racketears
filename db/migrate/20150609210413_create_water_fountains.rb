class CreateWaterFountains < ActiveRecord::Migration
  def change
    create_table :water_fountains do |t|
      t.string :name
      t.float :lat
      t.float :lon

      t.timestamps null: false
    end
  end
end
