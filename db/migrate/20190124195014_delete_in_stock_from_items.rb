class DeleteInStockFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :in_stock?
  end
end
