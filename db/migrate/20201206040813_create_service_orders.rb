class CreateServiceOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :service_orders do |t|
      t.string :protocol_number
      t.text :issue_reported
      t.text :observation
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
