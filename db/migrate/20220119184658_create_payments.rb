class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.integer :billing_type

      t.timestamps
    end
  end
end
