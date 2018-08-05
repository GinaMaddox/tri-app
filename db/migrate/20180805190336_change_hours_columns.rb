class ChangeHoursColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :sessions, :swim_hours, :string
  end
end
