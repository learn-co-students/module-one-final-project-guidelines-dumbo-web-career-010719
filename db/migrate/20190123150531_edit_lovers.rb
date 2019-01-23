class EditLovers < ActiveRecord::Migration[5.0]
  def change
    add_column :lovers, :first_meeting, :string
  end
end
