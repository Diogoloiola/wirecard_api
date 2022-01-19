class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :holder_name
      t.string :number
      t.string :expiration
      t.string :cvv

      t.timestamps
    end
  end
end
