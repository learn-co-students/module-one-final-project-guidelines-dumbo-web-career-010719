class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :games, :leagues
    add_foreign_key :players, :leagues
    add_foreign_key :creators, :leagues
  end
end
