class AddLoverMeet < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nikki, :boolean
    add_column :users, :kira, :boolean
    add_column :users, :princess, :boolean
    add_column :users, :penelope, :boolean
    add_column :users, :ryan, :boolean
    add_column :users, :john, :boolean
    add_column :users, :fabio, :boolean
    add_column :users, :oliver, :boolean
  end
end
