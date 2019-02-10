class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.integer :movie_id
      t.integer :rating
      t.boolean :watched
      t.string :feedback
      t.timestamps
    end
  end
end
