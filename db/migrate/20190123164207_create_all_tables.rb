class CreateAllTables < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string "title"
      t.string "genre"
      t.string "platform"
      t.string "1p_or_multi"
    end

    create_table :creators do |t|
      t.string "username"
    end

    create_table :players do |t|
      t.string  "username"
      t.string  "location"
      t.integer "age"
    end

    create_table :leagues do |t|
      t.string "name"
      t.string "location"
      t.date   "start_date"
      t.string "title"
    end
  end
end
