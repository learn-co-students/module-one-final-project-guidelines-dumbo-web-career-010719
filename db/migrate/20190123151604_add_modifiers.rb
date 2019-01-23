class AddModifiers < ActiveRecord::Migration[5.0]
  def change
    add_column :lovers, :aff_fitness_mod, :integer
    add_column :lovers, :aff_intellect_mod, :integer
    add_column :lovers, :aff_kindness_mod, :integer
    add_column :lovers, :aff_money_mod, :integer
    add_column :lovers, :aff_pts_req, :integer
  end
end
