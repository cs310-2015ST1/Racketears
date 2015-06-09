class CreateBikeracks < ActiveRecord::Migration
  def change
    create_table :bikeracks do |t|
      t.string :address
      t.quantity :int

      t.timestamps null: false
    end
  end
end
