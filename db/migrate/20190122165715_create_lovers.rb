class CreateLovers < ActiveRecord::Migration[5.0]
  def change
    create_table :lovers do |t|
      t.string :name
      t.string :gender
      t.integer :fitness_req
      t.integer :intellect_req
      t.integer :kindness_req
      t.integer :money_req
    end
  end
end
