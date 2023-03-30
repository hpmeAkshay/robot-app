class CreateRobots < ActiveRecord::Migration[7.0]
  def change
    create_table :robots do |t|
      t.integer :x_pos
      t.integer :y_pos
      t.string :direction

      t.timestamps
    end
  end
end
