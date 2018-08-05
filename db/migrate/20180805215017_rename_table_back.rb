class RenameTableBack < ActiveRecord::Migration[5.2]
  def change
    rename_table :workouts, :sessions
  end
end
