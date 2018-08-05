class ChangeColumnstoString < ActiveRecord::Migration[5.2]
  def change
    change_column :sessions, :swim_hours, :string
    change_column :sessions, :bike_hours, :string
    change_column :sessions, :run_hours, :string
  end
end
