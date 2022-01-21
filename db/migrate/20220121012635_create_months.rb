class CreateMonths < ActiveRecord::Migration[6.1]
  def change
    create_table :months do |t|
      t.integer :month_code
      t.references :year, null: false, foreign_key: true

      t.timestamps
    end
  end
end
