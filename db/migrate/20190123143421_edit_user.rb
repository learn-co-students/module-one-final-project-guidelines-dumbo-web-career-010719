class EditUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :total_days, :integer
    add_column :users, :work_days, :integer
    add_column :users, :volunteer_days, :integer
    add_column :users, :total_dates, :integer
    add_column :users, :gym_days, :integer
    add_column :users, :study_days, :integer
  end
end
