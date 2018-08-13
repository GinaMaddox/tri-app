class CreateSwims < ActiveRecord::Migration[5.2]
  def change
    create_table :swims do |t|
      t.string :session_number
      t.string :warm_up
      t.string :drills_1
      t.string :main_set
      t.string :drills_2
      t.string :cool_down
      t.integer :total_distance

      t.timestamps
    end
  end
end
