class DeleteLocationFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :location
  end
end
