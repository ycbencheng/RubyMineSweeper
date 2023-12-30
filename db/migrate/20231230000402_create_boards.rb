class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.integer :column, default: 2
      t.integer :row, default: 2
      t.integer :mines_count, default: 1
      t.string :email
      t.text :data

      t.timestamps
    end
  end
end
