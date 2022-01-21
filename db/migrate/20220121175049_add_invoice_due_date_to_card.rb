class AddInvoiceDueDateToCard < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :invoice_due_date, :datetime
  end
end
