class CreateForeignKeysManually < ActiveRecord::Migration[5.2]
  def change
    add_column :leagues, :game_id, :integer
    add_column :leagues, :player_id, :integer
    add_column :leagues, :creator_id, :integer
  end
end
