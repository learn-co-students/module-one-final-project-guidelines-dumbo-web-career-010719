class AddQuantityToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :quantity, :integer, default: 1
  end
end
