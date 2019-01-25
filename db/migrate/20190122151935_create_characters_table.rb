class CreateCharactersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
    end
  end
end
