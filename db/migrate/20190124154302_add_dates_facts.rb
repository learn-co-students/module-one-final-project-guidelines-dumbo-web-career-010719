class AddDatesFacts < ActiveRecord::Migration[5.0]
  def change
    add_column :dates, :fact_color, :string
    add_column :dates, :fact_season, :string
    add_column :dates, :fact_dream, :string
    add_column :dates, :fact_item, :string
    add_column :dates, :fact_place, :string
    add_column :dates, :fact_food, :string
  end
end
