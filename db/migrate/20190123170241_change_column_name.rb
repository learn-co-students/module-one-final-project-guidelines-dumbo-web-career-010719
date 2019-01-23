class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :games, :'1p_or_multi', :solo_or_multi
  end
end
