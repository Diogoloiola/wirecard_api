class AddDueDateToPaymen < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :due_date, :datetime
  end
end
