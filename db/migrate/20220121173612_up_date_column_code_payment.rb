class UpDateColumnCodePayment < ActiveRecord::Migration[6.1]
  def change
    change_column :payments, :code, :string
  end
end
