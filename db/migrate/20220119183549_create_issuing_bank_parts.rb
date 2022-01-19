class CreateIssuingBankParts < ActiveRecord::Migration[6.1]
  def change
    create_table :issuing_bank_parts do |t|
      t.references :card, null: false, foreign_key: true
      t.references :issuing_bank, null: false, foreign_key: true
      t.boolean :status
      t.decimal :balance

      t.timestamps
    end
  end
end
