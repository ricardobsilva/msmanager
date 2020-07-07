class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone_number
      t.string :second_phone_number
      t.string :email
      t.string :cnpj_cpf

      t.timestamps
    end
  end
end
