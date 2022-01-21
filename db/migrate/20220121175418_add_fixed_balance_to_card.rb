class AddFixedBalanceToCard < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :fixed_balance, :decimal
  end
end
