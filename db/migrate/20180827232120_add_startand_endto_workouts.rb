class AddStartandEndtoWorkouts < ActiveRecord::Migration[5.2]
  def change
  	add_column :workouts, :start_date, :date
  	add_column :workouts, :end_date, :date
  end
end
