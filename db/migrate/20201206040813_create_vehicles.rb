class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :plate
      t.string :year
      t.string :chassis
      t.string :model
      t.string :brand
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
