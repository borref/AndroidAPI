class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :model_year
      t.string :color

      t.timestamps
    end
  end
end
