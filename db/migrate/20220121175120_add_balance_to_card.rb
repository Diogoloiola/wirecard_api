class AddBalanceToCard < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :balance, :decimal
  end
end
