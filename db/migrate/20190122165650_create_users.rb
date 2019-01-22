class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.string :gender_preference
      t.integer :fitness
      t.integer :intellect
      t.integer :kindness
      t.integer :money
  end
end
