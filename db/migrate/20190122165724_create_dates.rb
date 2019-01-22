class CreateDates < ActiveRecord::Migration[5.0]
  def change
    create_table :dates do |t|
      t.integer :user_id
      t.integer :lovers_id
      t.integer :affection_pts
    end
  end
end
