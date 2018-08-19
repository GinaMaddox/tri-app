class AddPlanToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :plan_id, :integer
    add_column :users, :race_date, :date
  end
end
