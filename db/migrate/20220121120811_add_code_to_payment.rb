class AddCodeToPayment < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :code, :integer
  end
end
