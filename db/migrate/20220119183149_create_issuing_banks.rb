class CreateIssuingBanks < ActiveRecord::Migration[6.1]
  def change
    create_table :issuing_banks do |t|
      t.string :name

      t.timestamps
    end
  end
end
