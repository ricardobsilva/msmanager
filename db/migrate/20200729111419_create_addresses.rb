class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :street
      t.string :number
      t.string :complement
      t.string :neighborhood
      t.string :city

      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
