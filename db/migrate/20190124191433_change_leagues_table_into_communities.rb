class ChangeLeaguesTableIntoCommunities < ActiveRecord::Migration[5.2]
  def change
    rename_table :leagues, :communities
  end
end
