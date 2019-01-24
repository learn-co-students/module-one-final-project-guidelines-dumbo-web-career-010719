class DropNameInComm < ActiveRecord::Migration[5.2]
  def change
    remove_column :communities, :name
  end
end
