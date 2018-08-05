class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :phase
      t.integer :week
      t.integer :day
      t.integer :swim_hours
      t.string :swim
      t.integer :bike_hours
      t.string :bike
      t.integer :run_hours
      t.string :run
      t.integer :total_hours

      t.timestamps
    end
  end
end
