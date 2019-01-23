class AddLoversFacts < ActiveRecord::Migration[5.0]
  def change
    add_column :lovers, :fact_color, :string
    add_column :lovers, :fact_season, :string
    add_column :lovers, :fact_dream, :string
    add_column :lovers, :fact_item, :string
    add_column :lovers, :fact_place, :string
    add_column :lovers, :fact_food, :string
  end
end
