class ChangeLeaguesStartDateType < ActiveRecord::Migration[5.2]
  def change
    change_column :leagues, :start_date, :string
  end
end
