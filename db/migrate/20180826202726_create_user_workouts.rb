class CreateUserWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_workouts do |t|
      t.integer :user_id
      t.integer :workout_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
