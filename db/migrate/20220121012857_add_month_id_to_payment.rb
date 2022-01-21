class AddMonthIdToPayment < ActiveRecord::Migration[6.1]
  def change
    add_reference :payments, :month, null: false, foreign_key: true
  end
end
