class CreateInventoryTable < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.integer :char_id
      t.integer :item_id
    end
  end
end
