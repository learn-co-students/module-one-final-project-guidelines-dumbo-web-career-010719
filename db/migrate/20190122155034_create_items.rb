class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.boolean :in_stock?, default: true
      t.integer :store_id
    end
  end
end
