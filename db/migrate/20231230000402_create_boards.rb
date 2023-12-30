class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.integer :width
      t.integer :height
      t.integer :mines_count
      t.string :email
      t.text :data

      t.timestamps
    end
  end
end
